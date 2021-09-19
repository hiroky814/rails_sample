# frozen_string_literal: true

Rails.application.config.session_store :active_record_store, key: '_vehicle_management_session', expire_after: 30.minutes
