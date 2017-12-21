# ----------------------------------------------------------------------------------------------
# Not depend on website and environment
# ----------------------------------------------------------------------------------------------
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
DASHBOARD = { :DATE_TYPES => { :GENERAL => 0, :EXACT => 1} }

MIN_PAGE_SIZE = 10

# ----------------------------------------------------------------------------------------------
# Only depend on environment
# ----------------------------------------------------------------------------------------------
IS_PRODUCTION = ENV['RAILS_MAIL_ENV'].present? && ENV['RAILS_MAIL_ENV'] == 'production'
UPLOAD_FOLDER = IS_PRODUCTION ? 'production' : 'development'

DEFAULT_HOME_PAGE = ENV['DEFAULT_HOME_PAGE'] # only set this if we want to overide default value
MAIN_SERVER_HOST = ENV['MAIN_SERVER_HOST'] # only set this if we want to overide default value


# ----------------------------------------------------------------------------------------------
# WEBSITE_KEY: currently, we only allow 'imt'
# ----------------------------------------------------------------------------------------------
WEBSITE_KEY = ENV['WEBSITE_KEY'] || 'imt'
IS_IMT = WEBSITE_KEY == 'imt'


# ----------------------------------------------------------------------------------------------
# Depend on website
# ----------------------------------------------------------------------------------------------
WEBSITE_ENV = {
    'imt' => {
        :COMPANY_NAME       => 'IMT',
        :COMPANY_OFFICIAL_NAME => 'IMT Solution',
        :CONTACT_PHONE      => 'TBD',
        :CONTACT_ADDRESS    => 'TBD',
        :CONTACT_CITY       => 'TBD',
        :CONTACT_STATE      => 'TBD',
        :ENCRYPT_KEY        => 'imt',
        :DEFAULT_URL        => 'http://127.0.0.1:3000',
        :EMAIL => {
            :DEV_TEAM_EMAIL         => %w(tuanna@imt-soft.com tuanlq@imt-soft.com ngocntb@imt-soft.com),
            :TEST_EMAIL             => 'imt-testing@mailinator.com',
            :NO_REPLY               => ENV['EMAIL_NO_REPLY']          || 'imt-testing@mailinator.com',
            :CONTACT                => ENV['EMAIL_CONTACT']           || 'imt-testing@mailinator.com',
            :CC_NOTIFY              => ENV['EMAIL_CC_NOTIFY']         || 'imt-testing@mailinator.com',
            :INQUIRY                => ENV['EMAIL_INQUIRY']           || 'imt-testing@mailinator.com',
            :ACCOUNTANT_TEAM        => ENV['EMAIL_ACCOUNTANT_TEAM']   || 'imt-testing@mailinator.com',
            :SALE_TEAM              => ENV['EMAIL_SALE_TEAM']         || 'imt-testing@mailinator.com',
            :INTERNAL_TEAM          => ENV['EMAIL_INTERNAL_TEAM']     || 'imt-testing@mailinator.com',
            :PASSPORT_TEAM          => ENV['EMAIL_PASSPORT_TEAM']     || 'imt-testing@mailinator.com'
        },
        :SOCIAL_LINK => {
            :FACEBOOK   => '#',
            :INSTAGRAM  => '#',
            :PINTEREST  => '#',
            :TWITTER    => '#',
            :SNAPCHAT   => '#'
        },
        :FEATURES => {
            :GRADUATION => true
        }
    }
}

COMPANY_NAME = WEBSITE_ENV[WEBSITE_KEY][:COMPANY_NAME]
COMPANY_OFFICIAL_NAME = WEBSITE_ENV[WEBSITE_KEY][:COMPANY_OFFICIAL_NAME]
CONTACT_PHONE = WEBSITE_ENV[WEBSITE_KEY][:CONTACT_PHONE]
CONTACT_ADDRESS = WEBSITE_ENV[WEBSITE_KEY][:CONTACT_ADDRESS]
CONTACT_CITY = WEBSITE_ENV[WEBSITE_KEY][:CONTACT_CITY]
CONTACT_STATE = WEBSITE_ENV[WEBSITE_KEY][:CONTACT_STATE]

ENCRYPT_KEY = WEBSITE_ENV[WEBSITE_KEY][:ENCRYPT_KEY]
MAIN_SERVER_URL = MAIN_SERVER_HOST.blank? ? WEBSITE_ENV[WEBSITE_KEY][:DEFAULT_URL] : "https://#{MAIN_SERVER_HOST}"


# Default emails settings
DEV_TEAM_EMAIL = ENV['SUPER_ADMINS'] || WEBSITE_ENV[WEBSITE_KEY][:EMAIL][:DEV_TEAM_EMAIL]
TEST_EMAIL = WEBSITE_ENV[WEBSITE_KEY][:EMAIL][:TEST_EMAIL]

EMAIL_ADDRESS = {
    :NO_REPLY               => IS_PRODUCTION ? WEBSITE_ENV[WEBSITE_KEY][:EMAIL][:NO_REPLY] : TEST_EMAIL,
    :CONTACT                => IS_PRODUCTION ? WEBSITE_ENV[WEBSITE_KEY][:EMAIL][:CONTACT] : TEST_EMAIL,
    :CC_NOTIFY              => IS_PRODUCTION ? WEBSITE_ENV[WEBSITE_KEY][:EMAIL][:CC_NOTIFY] : TEST_EMAIL,
    :INQUIRY                => IS_PRODUCTION ? WEBSITE_ENV[WEBSITE_KEY][:EMAIL][:INQUIRY] : TEST_EMAIL,
    :ACCOUNTANT_TEAM        => IS_PRODUCTION ? WEBSITE_ENV[WEBSITE_KEY][:EMAIL][:ACCOUNTANT_TEAM] : TEST_EMAIL,
    :SALE_TEAM              => IS_PRODUCTION ? WEBSITE_ENV[WEBSITE_KEY][:EMAIL][:SALE_TEAM] : TEST_EMAIL,
    :INTERNAL_TEAM          => IS_PRODUCTION ? WEBSITE_ENV[WEBSITE_KEY][:EMAIL][:INTERNAL_TEAM] : TEST_EMAIL,
    :PASSPORT_TEAM          => IS_PRODUCTION ? WEBSITE_ENV[WEBSITE_KEY][:EMAIL][:PASSPORT_TEAM] : TEST_EMAIL
}

# Social links
SOCIAL_LINK = {
    :FACEBOOK   => WEBSITE_ENV[WEBSITE_KEY][:SOCIAL_LINK][:FACEBOOK],
    :INSTAGRAM  => WEBSITE_ENV[WEBSITE_KEY][:SOCIAL_LINK][:INSTAGRAM],
    :PINTEREST  => WEBSITE_ENV[WEBSITE_KEY][:SOCIAL_LINK][:PINTEREST],
    :TWITTER    => WEBSITE_ENV[WEBSITE_KEY][:SOCIAL_LINK][:TWITTER],
    :SNAPCHAT   => WEBSITE_ENV[WEBSITE_KEY][:SOCIAL_LINK][:SNAPCHAT]
}

# Toggle features
FEATURES = {
    :GRADUATION     => ENV['FEATURES_GRADUATION'] || WEBSITE_ENV[WEBSITE_KEY][:FEATURES][:GRADUATION]
}
