# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if TimeZone.count==0
  ActiveSupport::TimeZone::MAPPING.values.each do |t|
    TimeZone.create(name: t)
  end
end
## Country data
if Country.count==0
  Country.create(:name => 'United States')
  Country.create(:name => 'Mexico')
  Country.create(:name => 'Canada')
end
## State
if State.count==0 and Country.count !=0
  usa = Country.find_by_name('United States')
  mexico = Country.find_by_name('Mexico')
  canada = Country.find_by_name('Canada')
  State.create(:abbr => 'AL', :name => 'Alabama', :country_id => usa.id)
  State.create(:abbr => 'AK', :name => 'Alaska', :country_id => usa.id)
  State.create(:abbr => 'AZ', :name => 'Arizona', :country_id => usa.id)
  State.create(:abbr => 'AR', :name => 'Arkansas', :country_id => usa.id)
  State.create(:abbr => 'CA', :name => 'California', :country_id => usa.id)
  State.create(:abbr => 'CO', :name => 'Colorado', :country_id => usa.id)
  State.create(:abbr => 'CT', :name => 'Connecticut', :country_id => usa.id)
  State.create(:abbr => 'DE', :name => 'Delaware', :country_id => usa.id)
  State.create(:abbr => 'FL', :name => 'Florida', :country_id => usa.id)
  State.create(:abbr => 'GA', :name => 'Georgia', :country_id => usa.id)
  State.create(:abbr => 'HI', :name => 'Hawaii', :country_id => usa.id)
  State.create(:abbr => 'ID', :name => 'Idaho', :country_id => usa.id)
  State.create(:abbr => 'IL', :name => 'Illinois', :country_id => usa.id)
  State.create(:abbr => 'IN', :name => 'Indiana', :country_id => usa.id)
  State.create(:abbr => 'IA', :name => 'Iowa', :country_id => usa.id)
  State.create(:abbr => 'KS', :name => 'Kansas', :country_id => usa.id)
  State.create(:abbr => 'KY', :name => 'Kentucky', :country_id => usa.id)
  State.create(:abbr => 'LA', :name => 'Louisiana', :country_id => usa.id)
  State.create(:abbr => 'ME', :name => 'Maine', :country_id => usa.id)
  State.create(:abbr => 'MD', :name => 'Maryland', :country_id => usa.id)
  State.create(:abbr => 'MA', :name => 'Massachusetts', :country_id => usa.id)
  State.create(:abbr => 'MI', :name => 'Michigan', :country_id => usa.id)
  State.create(:abbr => 'MN', :name => 'Minnesota', :country_id => usa.id)
  State.create(:abbr => 'MS', :name => 'Mississippi', :country_id => usa.id)
  State.create(:abbr => 'MO', :name => 'Missouri', :country_id => usa.id)
  State.create(:abbr => 'MT', :name => 'Montana', :country_id => usa.id)
  State.create(:abbr => 'NE', :name => 'Nebraska', :country_id => usa.id)
  State.create(:abbr => 'NV', :name => 'Nevada', :country_id => usa.id)
  State.create(:abbr => 'NH', :name => 'New Hampshire', :country_id => usa.id)
  State.create(:abbr => 'NJ', :name => 'New Jersey', :country_id => usa.id)
  State.create(:abbr => 'NM', :name => 'New Mexico', :country_id => usa.id)
  State.create(:abbr => 'NY', :name => 'New York', :country_id => usa.id)
  State.create(:abbr => 'NC', :name => 'North Carolina', :country_id => usa.id)
  State.create(:abbr => 'ND', :name => 'North Dakota', :country_id => usa.id)
  State.create(:abbr => 'OH', :name => 'Ohio', :country_id => usa.id)
  State.create(:abbr => 'OK', :name => 'Oklahoma', :country_id => usa.id)
  State.create(:abbr => 'OR', :name => 'Oregon', :country_id => usa.id)
  State.create(:abbr => 'PA', :name => 'Pennsylvania', :country_id => usa.id)
  State.create(:abbr => 'RI', :name => 'Rhode Island', :country_id => usa.id)
  State.create(:abbr => 'SC', :name => 'South Carolina', :country_id => usa.id)
  State.create(:abbr => 'SD', :name => 'South Dakota', :country_id => usa.id)
  State.create(:abbr => 'TN', :name => 'Tennessee', :country_id => usa.id)
  State.create(:abbr => 'TX', :name => 'Texas', :country_id => usa.id)
  State.create(:abbr => 'UT', :name => 'Utah', :country_id => usa.id)
  State.create(:abbr => 'VT', :name => 'Vermont', :country_id => usa.id)
  State.create(:abbr => 'VA', :name => 'Virginia', :country_id => usa.id)
  State.create(:abbr => 'WA', :name => 'Washington', :country_id => usa.id)
  State.create(:abbr => 'WV', :name => 'West Virginia', :country_id => usa.id)
  State.create(:abbr => 'WI', :name => 'Wisconsin', :country_id => usa.id)
  State.create(:abbr => 'WY', :name => 'Wyoming', :country_id => usa.id)
  State.create(:abbr => 'DC', :name => 'District of Columbia', :country_id => usa.id)

  # Create states of Mexico
  State.create(:abbr => 'AG', :name => 'Aguascalientes', :country_id => mexico.id)
  State.create(:abbr => 'BN', :name => 'Baja California', :country_id => mexico.id)
  State.create(:abbr => 'BS', :name => 'Baja California Sur', :country_id => mexico.id)
  State.create(:abbr => 'CM', :name => 'Campeche', :country_id => mexico.id)
  State.create(:abbr => 'CP', :name => 'Chiapas', :country_id => mexico.id)
  State.create(:abbr => 'CH', :name => 'Chihuahua', :country_id => mexico.id)
  State.create(:abbr => 'CA', :name => 'Coahuila', :country_id => mexico.id)
  State.create(:abbr => 'CL', :name => 'Colima', :country_id => mexico.id)
  State.create(:abbr => 'DU', :name => 'Durango', :country_id => mexico.id)
  State.create(:abbr => 'DF', :name => 'Federal District', :country_id => mexico.id)
  State.create(:abbr => 'GT', :name => 'Guanajuato', :country_id => mexico.id)
  State.create(:abbr => 'GR', :name => 'Guerrero', :country_id => mexico.id)
  State.create(:abbr => 'HI', :name => 'Hidalgo', :country_id => mexico.id)
  State.create(:abbr => 'JA', :name => 'Jalisco', :country_id => mexico.id)
  State.create(:abbr => 'MX', :name => 'Mexico State', :country_id => mexico.id)
  State.create(:abbr => 'MC', :name => 'Michoacán', :country_id => mexico.id)
  State.create(:abbr => 'MR', :name => 'Morelos', :country_id => mexico.id)
  State.create(:abbr => 'NA', :name => 'Nayarit', :country_id => mexico.id)
  State.create(:abbr => 'NL', :name => 'Nuevo León', :country_id => mexico.id)
  State.create(:abbr => 'OA', :name => 'Oaxaca', :country_id => mexico.id)
  State.create(:abbr => 'PU', :name => 'Puebla', :country_id => mexico.id)
  State.create(:abbr => 'QE', :name => 'Querétaro', :country_id => mexico.id)
  State.create(:abbr => 'QR', :name => 'Quintana Roo', :country_id => mexico.id)
  State.create(:abbr => 'SL', :name => 'San Luis Potosí', :country_id => mexico.id)
  State.create(:abbr => 'SI', :name => 'Sinaloa', :country_id => mexico.id)
  State.create(:abbr => 'SO', :name => 'Sonora', :country_id => mexico.id)
  State.create(:abbr => 'TB', :name => 'Tabasco', :country_id => mexico.id)
  State.create(:abbr => 'TM', :name => 'Tamaulipas', :country_id => mexico.id)
  State.create(:abbr => 'TL', :name => 'Tlaxcala', :country_id => mexico.id)
  State.create(:abbr => 'VE', :name => 'Veracruz', :country_id => mexico.id)
  State.create(:abbr => 'YU', :name => 'Yucatán', :country_id => mexico.id)
  State.create(:abbr => 'ZA', :name => 'Zacatecas', :country_id => mexico.id)

  # Create states of Canada
  State.create(:abbr => 'AB', :name => 'Alberta', :country_id => canada.id)
  State.create(:abbr => 'BC', :name => 'British Columbia', :country_id => canada.id)
  State.create(:abbr => 'MB', :name => 'Manitoba', :country_id => canada.id)
  State.create(:abbr => 'NB', :name => 'New Brunswick', :country_id => canada.id)
  State.create(:abbr => 'NL', :name => 'Newfoundland and Labrador', :country_id => canada.id)
  State.create(:abbr => 'NS', :name => 'Nova Scotia', :country_id => canada.id)
  State.create(:abbr => 'NT', :name => 'Northwest Territories', :country_id => canada.id)
  State.create(:abbr => 'NU', :name => 'Nunavut', :country_id => canada.id)
  State.create(:abbr => 'ON', :name => 'Ontario', :country_id => canada.id)
  State.create(:abbr => 'PE', :name => 'Prince Edward Island', :country_id => canada.id)
  State.create(:abbr => 'QC', :name => 'Quebec', :country_id => canada.id)
  State.create(:abbr => 'SK', :name => 'Saskatchewan', :country_id => canada.id)
  State.create(:abbr => 'YT', :name => 'Yukon', :country_id => canada.id)
end
##Seed data for airline model
if School.count==0
  # theUS = Country.find_by_name('United States')
  # state = State.find_by_name('California')
  # state_fl = State.find_by_name('Florida')
  # stanford_university = School.create!(:name => 'Stanford University', country_id: theUS.id, state_id: state.id)
  # university_of_south_florida = School.create!(:name => 'University of South Florida', country_id: theUS.id, state_id: state_fl.id)
end
if Organization.count==0 and School.count !=0
  stanford_university = School.find_by(:name => 'Stanford University')
  university_of_south_florida = School.find_by(:name => 'University of South Florida')
  #Stanford Univeristy
  Organization.find_or_create_by(:name => 'Alpha Epsilon Pi', :school_id => stanford_university.id)
  Organization.find_or_create_by(:name => 'Delta Kappa Epsilon', :school_id => stanford_university.id)
  Organization.find_or_create_by(:name => 'Delta Tau Delta', :school_id => stanford_university.id)
  Organization.find_or_create_by(:name => 'Kappa Alpha', :school_id => stanford_university.id)
  Organization.find_or_create_by(:name => 'Kappa Sigma', :school_id => stanford_university.id)
  Organization.find_or_create_by(:name => 'Phi Kappa Psi', :school_id => stanford_university.id)
  Organization.find_or_create_by(:name => 'Sigma Alpha Epsilon', :school_id => stanford_university.id)
  Organization.find_or_create_by(:name => 'Sigma Chi', :school_id => stanford_university.id)
  Organization.find_or_create_by(:name => 'Sigma Nu', :school_id => stanford_university.id)
  Organization.find_or_create_by(:name => 'Sigma Phi Epsilon', :school_id => stanford_university.id)
  Organization.find_or_create_by(:name => 'Theta Delta Chi', :school_id => stanford_university.id)
  Organization.find_or_create_by(:name => 'Alpha Epsilon Ph', :school_id => stanford_university.id)
  Organization.find_or_create_by(:name => 'Alpha Phi', :school_id => stanford_university.id)
  Organization.find_or_create_by(:name => 'Chi Omega', :school_id => stanford_university.id)
  Organization.find_or_create_by(:name => 'Delta Delta Delta', :school_id => stanford_university.id)
  Organization.find_or_create_by(:name => 'Kappa Alpha Theta', :school_id => stanford_university.id)
  Organization.find_or_create_by(:name => 'Kappa Kappa Gamma', :school_id => stanford_university.id)
  Organization.find_or_create_by(:name => 'Pi Beta Phi', :school_id => stanford_university.id)

  #create organizations for University of South Florida school
  if Organization.find_by(:slug => 'alpha-epsilon-pi').blank?
    Organization.find_or_create_by(:name => 'Alpha Epsilon Pi', :slug => 'alpha-epsilon-pi', :school_id => university_of_south_florida.id)
  else
    if Organization.find_by(:slug => 'alpha-epsilon-pi', :school_id => university_of_south_florida.id).blank?
      Organization.find_or_create_by(:name => 'Alpha Epsilon Pi', :slug => university_of_south_florida.slug + '-' + 'alpha-epsilon-pi', :school_id => university_of_south_florida.id)
    end
  end

  if Organization.find_by(:slug => 'alpha-sigma-phi').blank?
    Organization.find_or_create_by(:name => 'Alpha Sigma Phi', :slug => 'alpha-sigma-phi', :school_id => university_of_south_florida.id)
  else
    if Organization.find_by(:slug => 'alpha-sigma-phi', :school_id => university_of_south_florida.id).blank?
      Organization.find_or_create_by(:name => 'Alpha Sigma Phi', :slug => university_of_south_florida.slug + '-' + 'alpha-sigma-phi', :school_id => university_of_south_florida.id)
    end
  end

  if Organization.find_by(:slug => 'chi-phi').blank?
    Organization.find_or_create_by(:name => 'Chi Phi', :slug => 'chi-phi', :school_id => university_of_south_florida.id)
  else
    if Organization.find_by(:slug => 'chi-phi', :school_id => university_of_south_florida.id).blank?
      Organization.find_or_create_by(:name => 'Chi Phi', :slug => university_of_south_florida.slug + '-' + 'chi-phi', :school_id => university_of_south_florida.id)
    end
  end

  if Organization.find_by(:slug => 'delta-chi').blank?
    Organization.find_or_create_by(:name => 'Delta Chi', :slug => 'delta-chi', :school_id => university_of_south_florida.id)
  else
    if Organization.find_by(:slug => 'delta-chi', :school_id => university_of_south_florida.id).blank?
      Organization.find_or_create_by(:name => 'Delta Chi', :slug => university_of_south_florida.slug + '-' + 'delta-chi', :school_id => university_of_south_florida.id)
    end
  end

  if Organization.find_by(:slug => 'kappa-sigma').blank?
    Organization.find_or_create_by(:name => 'Kappa Sigma', :slug => 'kappa-sigma', :school_id => university_of_south_florida.id)
  else
    if Organization.find_by(:slug => 'kappa-sigma', :school_id => university_of_south_florida.id).blank?
      Organization.find_or_create_by(:name => 'Kappa Sigma', :slug => university_of_south_florida.slug + '-' + 'kappa-sigma', :school_id => university_of_south_florida.id)
    end
  end

  if Organization.find_by(:slug => 'phi-gamma-delta').blank?
    Organization.find_or_create_by(:name => 'Phi Gamma Delta', :slug => 'phi-gamma-delta', :school_id => university_of_south_florida.id)
  else
    if Organization.find_by(:slug => 'phi-gamma-delta', :school_id => university_of_south_florida.id).blank?
      Organization.find_or_create_by(:name => 'Phi Gamma Delta', :slug => university_of_south_florida.slug + '-' + 'phi-gamma-delta', :school_id => university_of_south_florida.id)
    end
  end

  if Organization.find_by(:slug => 'pi-kappa-alpha').blank?
    Organization.find_or_create_by(:name => 'Pi Kappa Alpha', :slug => 'pi-kappa-alpha', :school_id => university_of_south_florida.id)
  else
    if Organization.find_by(:slug => 'pi-kappa-alpha', :school_id => university_of_south_florida.id).blank?
      Organization.find_or_create_by(:name => 'Pi Kappa Alpha', :slug => university_of_south_florida.slug + '-' + 'pi-kappa-alpha', :school_id => university_of_south_florida.id)
    end
  end

  if Organization.find_by(:slug => 'pi-kappa-phi').blank?
    Organization.find_or_create_by(:name => 'Pi Kappa Phi', :slug => 'pi-kappa-phi', :school_id => university_of_south_florida.id)
  else
    if Organization.find_by(:slug => 'pi-kappa-phi', :school_id => university_of_south_florida.id).blank?
      Organization.find_or_create_by(:name => 'Pi Kappa Phi', :slug => university_of_south_florida.slug + '-' + 'pi-kappa-phi', :school_id => university_of_south_florida.id)
    end
  end

  if Organization.find_by(:slug => 'sigma-chi').blank?
    Organization.find_or_create_by(:name => 'Sigma Chi', :slug => 'sigma-chi', :school_id => university_of_south_florida.id)
  else
    if Organization.find_by(:slug => 'sigma-chi', :school_id => university_of_south_florida.id).blank?
      Organization.find_or_create_by(:name => 'Sigma Chi', :slug => university_of_south_florida.slug + '-' + 'sigma-chi', :school_id => university_of_south_florida.id)
    end
  end

  if Organization.find_by(:slug => 'sigma-nu').blank?
    Organization.find_or_create_by(:name => 'Sigma Nu', :slug => 'sigma-nu', :school_id => university_of_south_florida.id)
  else
    if Organization.find_by(:slug => 'sigma-nus', :school_id => university_of_south_florida.id).blank?
      Organization.find_or_create_by(:name => 'Sigma Nu', :slug => university_of_south_florida.slug + '-' + 'sigma-nu', :school_id => university_of_south_florida.id)
    end
  end

  if Organization.find_by(:slug => 'sigma-phi-epsilon').blank?
    Organization.find_or_create_by(:name => 'Sigma Phi Epsilon', :slug => 'sigma-phi-epsilon', :school_id => university_of_south_florida.id)
  else
    if Organization.find_by(:slug => 'sigma-phi-epsilon', :school_id => university_of_south_florida.id).blank?
      Organization.find_or_create_by(:name => 'Sigma Phi Epsilon', :slug => university_of_south_florida.slug + '-' + 'sigma-phi-epsilon', :school_id => university_of_south_florida.id)
    end
  end

  if Organization.find_by(:slug => 'sigma-pi').blank?
    Organization.find_or_create_by(:name => 'Sigma Pi', :slug => 'sigma-pi', :school_id => university_of_south_florida.id)
  else
    if Organization.find_by(:slug => 'sigma-pi', :school_id => university_of_south_florida.id).blank?
      Organization.find_or_create_by(:name => 'Sigma Pi', :slug => university_of_south_florida.slug + '-' + 'sigma-pi', :school_id => university_of_south_florida.id)
    end
  end

  if Organization.find_by(:slug => 'theta-chi').blank?
    Organization.find_or_create_by(:name => 'Theta Chi', :slug => 'theta-chi', :school_id => university_of_south_florida.id)
  else
    if Organization.find_by(:slug => 'theta-chi', :school_id => university_of_south_florida.id).blank?
      Organization.find_or_create_by(:name => 'Theta Chi', :slug => university_of_south_florida.slug + '-' + 'theta-chi', :school_id => university_of_south_florida.id)
    end
  end

  if Organization.find_by(:slug => 'zeta-beta-tau').blank?
    Organization.find_or_create_by(:name => 'Zeta Beta Tau', :slug => 'zeta-beta-tau', :school_id => university_of_south_florida.id)
  else
    if Organization.find_by(:slug => 'zeta-beta-tau', :school_id => university_of_south_florida.id).blank?
      Organization.find_or_create_by(:name => 'Zeta Beta Tau', :slug => university_of_south_florida.slug + '-' + 'zeta-beta-tau', :school_id => university_of_south_florida.id)
    end
  end
end
if Airport.count==0
  # US country (refer: http://www.nationsonline.org/oneworld/major_US_airports.htm)
  Airport.find_or_create_by(:code => 'ATL', :name => 'Hartsfield-Jackson Atlanta International', :city => 'Atlanta', :state_id => State.find_by(:country_id => 1, :name => 'Georgia').nil? ? nil : State.find_by(:country_id => 1, :name => 'Georgia').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'ANC', :name => 'Ted Stevens Anchorage International Airport', :city => 'Anchorage', :state_id => State.find_by(:country_id => 1, :name => 'Alaska').nil? ? nil : State.find_by(:country_id => 1, :name => 'Alaska').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'AUS', :name => 'Austin-Bergstrom International', :city => 'Austin', :state_id => State.find_by(:country_id => 1, :name => 'Texas').nil? ? nil : State.find_by(:country_id => 1, :name => 'Texas').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'BWI', :name => 'Baltimore/Washington International - BWI Airport', :city => 'Baltimore', :state_id => State.find_by(:country_id => 1, :name => 'Maryland').nil? ? nil : State.find_by(:country_id => 1, :name => 'Maryland').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'BOS', :name => 'Logan International', :city => 'Boston', :state_id => State.find_by(:country_id => 1, :name => 'Massachusetts').nil? ? nil : State.find_by(:country_id => 1, :name => 'Massachusetts').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'CLT', :name => 'Charlotte Douglas International', :city => 'Charlotte', :state_id => State.find_by(:country_id => 1, :name => 'North Carolina').nil? ? nil : State.find_by(:country_id => 1, :name => 'North Carolina').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'MDW', :name => 'Chicago Midway Airport', :city => 'Chicago', :state_id => State.find_by(:country_id => 1, :name => 'Illinois').nil? ? nil : State.find_by(:country_id => 1, :name => 'Illinois').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'ORD', :name => 'Chicago OHare International', :city => 'Chicago', :state_id => State.find_by(:country_id => 1, :name => 'Illinois').nil? ? nil : State.find_by(:country_id => 1, :name => 'Illinois').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'CVG', :name => 'Cincinnati/Northern Kentucky International', :city => 'Cincinnati', :state_id => State.find_by(:country_id => 1, :name => 'Ohio').nil? ? nil : State.find_by(:country_id => 1, :name => 'Ohio').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'CLE', :name => 'Cleveland Hopkins International', :city => 'Cleveland', :state_id => State.find_by(:country_id => 1, :name => 'Ohio').nil? ? nil : State.find_by(:country_id => 1, :name => 'Ohio').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'CMH', :name => 'Port Columbus International', :city => 'Columbus', :state_id => State.find_by(:country_id => 1, :name => 'Ohio').nil? ? nil : State.find_by(:country_id => 1, :name => 'Ohio').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'DFW', :name => 'Dallas/Ft. Worth International - DFW Airport', :city => 'Dallas', :state_id => State.find_by(:country_id => 1, :name => 'Texas').nil? ? nil : State.find_by(:country_id => 1, :name => 'Texas').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'DEN', :name => 'Denver International Airport', :city => 'Denver', :state_id => State.find_by(:country_id => 1, :name => 'Colorado').nil? ? nil : State.find_by(:country_id => 1, :name => 'Colorado').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'DTW', :name => 'Detroit Metropolitan Wayne County Airport', :city => 'Detroit', :state_id => State.find_by(:country_id => 1, :name => 'Michigan').nil? ? nil : State.find_by(:country_id => 1, :name => 'Michigan').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'FLL', :name => 'Fort Lauderdale/Hollywood International', :city => 'Fort Lauderdale', :state_id => State.find_by(:country_id => 1, :name => 'Florida').nil? ? nil : State.find_by(:country_id => 1, :name => 'Florida').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'RSW', :name => 'Southwest Florida International', :city => 'Fort Myers', :state_id => State.find_by(:country_id => 1, :name => 'Florida').nil? ? nil : State.find_by(:country_id => 1, :name => 'Florida').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'BDL', :name => 'Bradley International', :city => 'Hartford', :state_id => State.find_by(:country_id => 1, :name => 'Connecticut').nil? ? nil : State.find_by(:country_id => 1, :name => 'Connecticut').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'HNL', :name => 'Hawaii Honolulu International', :city => 'Honolulu', :state_id => State.find_by(:country_id => 1, :name => 'Hawaii').nil? ? nil : State.find_by(:country_id => 1, :name => 'Hawaii').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'IAH', :name => 'George Bush Intercontinental', :city => 'Houston', :state_id => State.find_by(:country_id => 1, :name => 'Texas').nil? ? nil : State.find_by(:country_id => 1, :name => 'Texas').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'HOU', :name => 'William P. Hobby Airport', :city => 'Houston', :state_id => State.find_by(:country_id => 1, :name => 'Texas').nil? ? nil : State.find_by(:country_id => 1, :name => 'Texas').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'IND', :name => 'Indianapolis International', :city => 'Indianapolis', :state_id => State.find_by(:country_id => 1, :name => 'Indiana').nil? ? nil : State.find_by(:country_id => 1, :name => 'Indiana').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'MCI', :name => 'Kansas City International', :city => 'Kansas City', :state_id => State.find_by(:country_id => 1, :name => 'Missouri').nil? ? nil : State.find_by(:country_id => 1, :name => 'Missouri').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'LAS', :name => 'McCarran International', :city => 'Las Vegas', :state_id => State.find_by(:country_id => 1, :name => 'Nevada').nil? ? nil : State.find_by(:country_id => 1, :name => 'Nevada').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'LAX', :name => 'Los Angeles International - LAX Airport', :city => 'Los Angeles', :state_id => State.find_by(:country_id => 1, :name => 'California').nil? ? nil : State.find_by(:country_id => 1, :name => 'California').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'MEM', :name => 'Memphis International', :city => 'Memphis', :state_id => State.find_by(:country_id => 1, :name => 'Tennessee').nil? ? nil : State.find_by(:country_id => 1, :name => 'Tennessee').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'MIA', :name => 'Miami International Airport', :city => 'Miami', :state_id => State.find_by(:country_id => 1, :name => 'Florida').nil? ? nil : State.find_by(:country_id => 1, :name => 'Florida').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'MSP', :name => 'Minneapolis/St. Paul International', :city => 'Minneapolis', :state_id => State.find_by(:country_id => 1, :name => 'Minnesota').nil? ? nil : State.find_by(:country_id => 1, :name => 'Minnesota').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'BNA', :name => 'Nashville International', :city => 'Nashville', :state_id => State.find_by(:country_id => 1, :name => 'Tennessee').nil? ? nil : State.find_by(:country_id => 1, :name => 'Tennessee').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'MSY', :name => 'Louis Armstrong International', :city => 'New Orleans', :state_id => State.find_by(:country_id => 1, :name => 'Louisiana').nil? ? nil : State.find_by(:country_id => 1, :name => 'Louisiana').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'JFK', :name => 'John F. Kennedy International', :city => 'New York', :state_id => State.find_by(:country_id => 1, :name => 'New York').nil? ? nil : State.find_by(:country_id => 1, :name => 'New York').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'LGA', :name => 'LaGuardia International', :city => 'New York', :state_id => State.find_by(:country_id => 1, :name => 'New York').nil? ? nil : State.find_by(:country_id => 1, :name => 'New York').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'EWR', :name => 'Newark Liberty International', :city => 'Newark', :state_id => State.find_by(:country_id => 1, :name => 'New Jersey').nil? ? nil : State.find_by(:country_id => 1, :name => 'New Jersey').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'OAK', :name => 'Metropolitan Oakland International', :city => 'Oakland', :state_id => State.find_by(:country_id => 1, :name => 'California').nil? ? nil : State.find_by(:country_id => 1, :name => 'California').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'ONT', :name => 'Ontario International', :city => 'Ontario', :state_id => State.find_by(:country_id => 1, :name => 'California').nil? ? nil : State.find_by(:country_id => 1, :name => 'California').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'MCO', :name => 'Orlando International', :city => 'Orlando', :state_id => State.find_by(:country_id => 1, :name => 'Florida').nil? ? nil : State.find_by(:country_id => 1, :name => 'Florida').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'PHL', :name => 'Philadelphia International', :city => 'Philadelphia', :state_id => State.find_by(:country_id => 1, :name => 'Pennsylvania').nil? ? nil : State.find_by(:country_id => 1, :name => 'Pennsylvania').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'PHX', :name => 'Sky Harbor International', :city => 'Phoenix', :state_id => State.find_by(:country_id => 1, :name => 'Arizona').nil? ? nil : State.find_by(:country_id => 1, :name => 'Arizona').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'PIT', :name => 'Pittsburgh International', :city => 'Pittsburgh', :state_id => State.find_by(:country_id => 1, :name => 'Pennsylvania').nil? ? nil : State.find_by(:country_id => 1, :name => 'Pennsylvania').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'PDX', :name => 'Portland International', :city => 'Portland', :state_id => State.find_by(:country_id => 1, :name => 'Oregon').nil? ? nil : State.find_by(:country_id => 1, :name => 'Oregon').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'RDU', :name => 'Raleigh-Durham International', :city => 'Raleigh-Durham', :state_id => State.find_by(:country_id => 1, :name => 'North Carolina').nil? ? nil : State.find_by(:country_id => 1, :name => 'North Carolina').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'SMF', :name => 'Sacramento International', :city => 'Sacramento', :state_id => State.find_by(:country_id => 1, :name => 'California').nil? ? nil : State.find_by(:country_id => 1, :name => 'California').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'SLC', :name => 'Salt Lake City International', :city => 'Salt Lake City', :state_id => State.find_by(:country_id => 1, :name => 'Utah').nil? ? nil : State.find_by(:country_id => 1, :name => 'Utah').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'SAT', :name => 'San Antonio International', :city => 'San Antonio', :state_id => State.find_by(:country_id => 1, :name => 'Texas').nil? ? nil : State.find_by(:country_id => 1, :name => 'Texas').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'SAN', :name => 'Lindbergh Field International', :city => 'San Diego', :state_id => State.find_by(:country_id => 1, :name => 'California').nil? ? nil : State.find_by(:country_id => 1, :name => 'California').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'SFO', :name => 'San Francisco International', :city => 'San Francisco', :state_id => State.find_by(:country_id => 1, :name => 'California').nil? ? nil : State.find_by(:country_id => 1, :name => 'California').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'SJC', :name => 'Mineta San José International', :city => 'San Jose', :state_id => State.find_by(:country_id => 1, :name => 'California').nil? ? nil : State.find_by(:country_id => 1, :name => 'California').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'SNA', :name => 'John Wayne Airport, Orange County', :city => 'Santa Ana', :state_id => State.find_by(:country_id => 1, :name => 'California').nil? ? nil : State.find_by(:country_id => 1, :name => 'California').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'SEA', :name => 'Seattle-Tacoma International - Seatac Airport', :city => 'Seattle', :state_id => State.find_by(:country_id => 1, :name => 'Washington').nil? ? nil : State.find_by(:country_id => 1, :name => 'Washington').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'STL', :name => 'Lambert-St. Louis International', :city => 'St. Louis', :state_id => State.find_by(:country_id => 1, :name => 'Missouri').nil? ? nil : State.find_by(:country_id => 1, :name => 'Missouri').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'TPA', :name => 'Tampa International', :city => 'Tampa', :state_id => State.find_by(:country_id => 1, :name => 'Florida').nil? ? nil : State.find_by(:country_id => 1, :name => 'Florida').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'IAD', :name => 'Dulles International Airport', :city => 'Washington D.C.', :state_id => State.find_by(:country_id => 1, :name => 'District of Columbia').nil? ? nil : State.find_by(:country_id => 1, :name => 'District of Columbia').id, :country_id => 1)
  Airport.find_or_create_by(:code => 'DCA', :name => 'Ronald Reagan Washington National', :city => 'Washington D.C.', :state_id => State.find_by(:country_id => 1, :name => 'District of Columbia').nil? ? nil : State.find_by(:country_id => 1, :name => 'District of Columbia').id, :country_id => 1)


  # Mehico Airport ( only for San Jose del Cabo Airport)
  Airport.find_or_create_by(:code => 'SJD', :name => 'San Jose del Cabo', :city => 'San Jose del Cabo', :state_id => State.find_by(:country_id => 2, :name => 'Baja California Sur').nil? ? nil : State.find_by(:country_id => 2, :name => 'Baja California Sur').id, :country_id => 2)


  # Canadian Airport (refer: http://www.nationsonline.org/oneworld/major_US_airports.htm)
  Airport.find_or_create_by(:code => 'YYC', :name => 'Calgary International Airport', :city => 'Calgary', :state_id => State.find_by(:country_id => 3, :name => 'Alberta').nil? ? nil : State.find_by(:country_id => 3, :name => 'Alberta').id, :country_id => 3)
  Airport.find_or_create_by(:code => 'YUL', :name => 'Pierre Elliott Trudeau International Airpor', :city => 'Montréal', :state_id => State.find_by(:country_id => 3, :name => 'Quebec').nil? ? nil : State.find_by(:country_id => 3, :name => 'Quebec').id, :country_id => 3)
  Airport.find_or_create_by(:code => 'YOW', :name => 'Ottawa Macdonald-Cartier International Airport', :city => 'Ottawa', :state_id => State.find_by(:country_id => 3, :name => 'Ontario').nil? ? nil : State.find_by(:country_id => 3, :name => 'Ontario').id, :country_id => 3)
  Airport.find_or_create_by(:code => 'YQB', :name => 'Quebéc City Airport, Jean Lesage International Airport', :city => 'Québec', :state_id => State.find_by(:country_id => 3, :name => 'Quebec').nil? ? nil : State.find_by(:country_id => 3, :name => 'Quebec').id, :country_id => 3)
  Airport.find_or_create_by(:code => 'YYZ', :name => 'Lester B. Pearson International Airport', :city => 'Toronto', :state_id => State.find_by(:country_id => 3, :name => 'Ontario').nil? ? nil : State.find_by(:country_id => 3, :name => 'Ontario').id, :country_id => 3)
  Airport.find_or_create_by(:code => 'YVR', :name => 'Vancouver International Airport', :city => 'Vancouver', :state_id => State.find_by(:country_id => 3, :name => 'British Columbia').nil? ? nil : State.find_by(:country_id => 3, :name => 'British Columbia').id, :country_id => 3)

end

# Update airport without timezone to default timezone: Pacific Time Zone
pacific_time_zone = TimeZone.find_by(:name => 'America/Los_Angeles')
Airport.where(:time_zone_id => nil).update_all("time_zone_id = #{pacific_time_zone.id}") if pacific_time_zone.present?
