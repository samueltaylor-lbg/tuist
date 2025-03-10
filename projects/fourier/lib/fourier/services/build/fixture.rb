# frozen_string_literal: true

module Fourier
  module Services
    module Build
      class Fixture < Base
        attr_reader :configuration
        def initialize(configuration: "debug")
          @configuration = configuration
        end

        def call
          Dir.chdir(Constants::ROOT_DIRECTORY) do
            Utilities::System.system(
              "swift",
              "build",
              "--configuration",
              configuration,
              "--target",
              "tuistfixturegenerator")
          end
        end
      end
    end
  end
end
