# frozen_string_literal: true

class InitData
  require 'csv'

  def self.create
    CSV.foreach('db/user_data.csv') do |row|
      User.create!(user_id: row[1],
                   password: row[2],
                   company_name: row[3],
                   address: row[4],
                   person_in_charge: row[5],
                   email: row[6],
                   phone_number: row[7],
                   authority: row[8])
    end
    CSV.foreach('db/software_data.csv') do |row|
      MmsRelatedSoftware.create!(user_id: row[1],
                                 post_processing_analysis: convert(row[2]),
                                 landmark_update: convert(row[3]),
                                 viewer_converter: convert(row[4]),
                                 mms_editor: convert(row[5]),
                                 mms_tracer: convert(row[6]),
                                 ortho_generator: convert(row[7]),
                                 wing_earth_3dwing: convert(row[8]),
                                 wing_earth_3dwing_limit: convert(row[9]))
    end
    CSV.foreach('db/vehicle_and_option.csv') do |row|
      Vehicle.create!(user_id: row[1],
                      vehicle_id: row[2],
                      registered_vehicle: row[3],
                      vehicle_type: row[4])
      ProductConfiguration.create!(user_id: row[1],
                                   vehicle_id: row[2],
                                   standard_camera_type: row[5],
                                   standard_camera_number: row[6],
                                   additional_camera: row[7],
                                   standard_laser_type: row[8],
                                   standard_laser_number: row[9],
                                   additional_laser: row[10],
                                   gnss: row[11],
                                   imu: row[12],
                                   flatness_sensor: row[13],
                                   line_camera: row[14],
                                   odometry: row[15])
    end
  end

  def self.convert(data)
    return if data.blank?

    data.split('|')
  end
end

InitData.create
