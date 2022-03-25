# Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# This file is licensed under the Apache License, Version 2.0 (the "License").
# You may not use this file except in compliance with the License. A copy of the
# License is located at
#
# http://aws.amazon.com/apache2.0/
#
# This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS
# OF ANY KIND, either express or implied. See the License for the specific
# language governing permissions and limitations under the License.

require 'aws-sdk'  # In v2: require 'aws-sdk'

class PollyController < ActionController::Base

    def speak
    
    begin
    # Get the filename from the command line
        # if ARGV.empty?()
        #     # puts 'greetings.wav'
        #     ARGV << 'greetings.wav'
        #     exit 1
        # end

    # filename = ARGV[0]

    # Open file and get the contents as a string
    # if File.exist?(filename)
    #     contents = IO.read(filename)
    # else
    #     puts 'No such file: ' + filename
    #     exit 1
    # end
 
    # Create an Amazon Polly client using
    # credentials from the shared credentials file ~/.aws/credentials
    # and the configuration (region) from the shared configuration file ~/.aws/config
    polly = Aws::Polly::Client.new(
        access_key_id: ENV['aws_access_key_id'],
        secret_access_key: ENV['aws_secret_access_key']
        )

        resp = client.start_speech_synthesis_task({
            engine: "standard", # accepts standard, neural
            language_code: "en-US", # accepts arb, cmn-CN, cy-GB, da-DK, de-DE, en-AU, en-GB, en-GB-WLS, en-IN, en-US, es-ES, es-MX, es-US, fr-CA, fr-FR, is-IS, it-IT, ja-JP, hi-IN, ko-KR, nb-NO, nl-NL, pl-PL, pt-BR, pt-PT, ro-RO, ru-RU, sv-SE, tr-TR, en-NZ, en-ZA, ca-ES
            # lexicon_names: ["LexiconName"],
            output_format: "mp3", # required, accepts json, mp3, ogg_vorbis, pcm
            # output_s3_bucket_name: "OutputS3BucketName", # required
            # output_s3_key_prefix: "OutputS3KeyPrefix",
            sample_rate: "SampleRate",
            sns_topic_arn: "SnsTopicArn",
            speech_mark_types: ["sentence"], # accepts sentence, ssml, viseme, word
            text: "Hello! Thank you for visiting Rocket Elevators. There are currently elevators deployed in the #{buildings} buildings of your #{customers} customers. Currently, #{elevators} elevators are inactive and are being serviced. You have #{quotes} quotes awaiting processing. You have #{leads} leads in your contact requests. #{batteries} batteries are deployed across #{cities} cities.", # required
            text_type: "ssml", # accepts ssml, text
            voice_id: "Joanna", # required, accepts Aditi, Amy, Astrid, Bianca, Brian, Camila, Carla, Carmen, Celine, Chantal, Conchita, Cristiano, Dora, Emma, Enrique, Ewa, Filiz, Gabrielle, Geraint, Giorgio, Gwyneth, Hans, Ines, Ivy, Jacek, Jan, Joanna, Joey, Justin, Karl, Kendra, Kevin, Kimberly, Lea, Liv, Lotte, Lucia, Lupe, Mads, Maja, Marlene, Mathieu, Matthew, Maxim, Mia, Miguel, Mizuki, Naja, Nicole, Olivia, Penelope, Raveena, Ricardo, Ruben, Russell, Salli, Seoyeon, Takumi, Tatyana, Vicki, Vitoria, Zeina, Zhiyu, Aria, Ayanda, Arlet
          })
        


        # config.assets.precompile << "audios/*"
        # File.open('greetings.mp3') 
        # do |audio_file|
            # audio_file.write(response)
            # # speaker_model = text_to_speech.create_speaker_model(
            # # speaker_name: "speaker_one",
            # audio: audio_file
            # puts JSON.pretty_generate(speaker_model.result)
        end
    end
end


        

    # resp = polly.synthesize_speech({
    #     output_format: "mp3",
    #     text: "Hello! Thank you for visiting Rocket Elevators. There are currently #{elevators} elevators deployed in the #{buildings} buildings of your #{customers} customers. Currently, #{elevators} elevators are inactive and are being serviced. You have #{quotes} quotes awaiting processing. You have #{leads} leads in your contact requests. #{batteries} batteries are deployed across #{cities} cities.",
    #     voice_id: "Joanna",
    # })

    # IO.copy_stream(resp.audio_stream, "#{params[:text]}.mp3") 
    #     puts "Params: "
    #     puts params[:text]
    #     send_file "#{params[:text]}.mp3"
    # end
    # # Save output
    # # Get just the file name
    # #  abc/xyz.txt -> xyx.txt
    # name = File.basename(filename)

    # # Split up name so we get just the xyz part
    # parts = name.split('.')
    # first_part = parts[0]
    # wav_file = first_part + '.wav'

    # IO.copy_stream(resp.audio_stream, wav_file)

    #     puts 'Wrote WAV content to: ' + wav_file
    # rescue StandardError => ex
    #     puts 'Got error:'
    #     puts 'Error message:'
    #     puts ex.message

    



#   resp = polly.synthesize_speech({
#     text: "Hello! Thank you for visiting Rocket Elevators. There are currently elevators deployed in the #{buildings} buildings of your #{customers} customers. Currently, #{elevators} elevators are inactive and are being serviced. You have #{quotes} quotes awaiting processing. You have #{leads} leads in your contact requests. #{batteries} batteries are deployed across #{cities} cities.",
#     accept:"audio/mp3",
#     voice_id: "Joanna"

# }).result


    end
end