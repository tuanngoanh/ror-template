//= require rails-ujs
//= require jquery
//= require jquery_ujs

//= require universal/universal
//= require toastr
//= require angular
//= require ckeditor/init
//= require jquery-ui/core
//= require jquery-ui/widgets/sortable
//= require jquery-ui/widgets/datepicker

//= require admin/admin

//= require ./app
//= require turbolinks
//= require base/init
//= require base/angular_app
//= require base/angular_utils
//= require_tree ./pages

var dataTable;
$(document).on('turbolinks:load', function () {
    $('textarea.ckeditor').each(function () {
        if ($(this).css('visibility') !== 'hidden') {
            return CKEDITOR.replace(this);
        }
    });

    var $els, el, i, len;
    $els = $('form input[type="filepicker"]');
    for (i = 0, len = $els.length; i < len; i++) {
        el = $els[i];
        if ($(el).css('display') === 'inline-block' || $(el).css('display') === 'undefined') {
            filepicker.constructWidget(el);
        }
    }

    dataTable = $('.datatable').DataTable({
        "paging": false,
        "lengthChange": false,
        "searching": false,
        "ordering": true,
        "info": false,
        "autoWidth": false,
        'aoColumnDefs': [{
            'bSortable': false,
            'aTargets': ['no-sorter']
        }]
    });

    //Fix for IE page transitions
    $("body").removeClass("hold-transition");

    //Extend options if external options exist
    if (typeof AdminLTEOptions !== "undefined") {
        $.extend(true,
            $.AdminLTE.options,
            AdminLTEOptions);
    }

    //Easy access to options
    var o = $.AdminLTE.options;

    //Set up the object
    _init();

    //Activate the layout maker
    $.AdminLTE.layout.activate();
    //Enable sidebar tree view controls
    $.AdminLTE.tree('.sidebar');

    //Enable control sidebar
    if (o.enableControlSidebar) {
        $.AdminLTE.controlSidebar.activate();
    }

    //Add slimscroll to navbar dropdown
    if (o.navbarMenuSlimscroll && typeof $.fn.slimscroll != 'undefined') {
        $(".navbar .menu").slimscroll({
            height: o.navbarMenuHeight,
            alwaysVisible: false,
            size: o.navbarMenuSlimscrollWidth
        }).css("width", "100%");
    }

    //Activate sidebar push menu
    if (o.sidebarPushMenu) {
        $.AdminLTE.pushMenu.activate(o.sidebarToggleSelector);
    }

    //Activate Bootstrap tooltip
    if (o.enableBSToppltip) {
        $('body').tooltip({
            selector: o.BSTooltipSelector
        });
    }

    //Activate box widget
    if (o.enableBoxWidget) {
        $.AdminLTE.boxWidget.activate();
    }

    //Activate fast click
    if (o.enableFastclick && typeof FastClick != 'undefined') {
        FastClick.attach(document.body);
    }

    //Activate direct chat widget
    if (o.directChat.enable) {
        $(document).on('click', o.directChat.contactToggleSelector, function () {
            var box = $(this).parents('.direct-chat').first();
            box.toggleClass('direct-chat-contacts-open');
        });
    }

    /*
     * INITIALIZE BUTTON TOGGLE
     * ------------------------
     */
    $('.btn-group[data-toggle="btn-toggle"]').each(function () {
        var group = $(this);
        $(this).find(".btn").on('click', function (e) {
            group.find(".btn.active").removeClass("active");
            $(this).addClass("active");
            e.preventDefault();
        });
    });

    /*
     * INITIALIZE SORTABLE
     * ------------------------
     */
    if ($(".connectedSortable").length) {
        $(".connectedSortable").sortable({
            placeholder: "sort-highlight",
            connectWith: ".connectedSortable",
            handle: ".box-header, .nav-tabs",
            forcePlaceholderSize: true,
            zIndex: 999999
        });
    }

    $(".connectedSortable .box-header, .connectedSortable .nav-tabs-custom").css("cursor", "move");

    $('[data-toggle="tooltip"]').tooltip();
    $(".multiselect").select2();
    $('.datepicker, [data-behaviour="datepicker"]').datepicker({
        dateFormat: 'yy-mm-dd'
    });
    $('.progress-bar-tooltip').tooltip({html:true});

    $('.modal').on('shown.bs.modal', function () {
        $('[data-toggle="tooltip"]').tooltip();
        $(".multiselect").select2();
        $('.datepicker, [data-behaviour="datepicker"]').datepicker({
            dateFormat: 'yy-mm-dd'
        });
    });

    $(document).off("click", '.menu-tabs').on("click", '.menu-tabs', function () {
        $(".nav-tabs li").toggleClass('nav-tab');
    });

    $('body').off('click', '.right-buttons, .collapse-buttons').on('click', '.right-buttons, .collapse-buttons', function () {
        var child = $(this).parent().next('.box-body');
        $(this).find('span').text(child.is(":visible") ? 'Expand' : 'Collapse');
        $(this).find(' > i').toggleClass('fa-chevron-circle-down').toggleClass('fa-chevron-circle-up');
        child.toggle('fast');
    });
});

document.addEventListener("turbolinks:before-cache", function () {
    if (dataTable !== null) {
        dataTable.destroy();
        dataTable = null;
    }
    $(".multiselect").select2('destroy');
    $('#flash_message_script').remove();
    $('#toast-container').remove();
});

// Functions
function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    var expires = "expires=" + d.toGMTString();
    document.cookie = cname + "=" + cvalue + "; " + expires + ";path=/";
    console.log(document.cookie);
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') c = c.substring(1);
        if (c.indexOf(name) != -1) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function deleteCookie(name) {
    document.cookie = name + "=; expires=Thu, 01-Jan-70 00:00:01 GMT;path=/";
}
