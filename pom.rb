project 'processing-core', 'https://github.com/monkstone/processing' do

  model_version '4.0.0'
  id 'processing:core:4.0.0'
  packaging 'jar'

  description 'An integrated processing-core (somewhat hacked), with additional java code for a jruby version of processing.'

  developer 'monkstone' do
    name 'Martin Prout'
    roles 'developer'
  end

  developer 'sampottinger' do
    name 'Sam Pottinger'
    roles 'developer'
  end

  developer 'benfry' do
    name 'Ben Fry'
    roles 'developer'
  end

  developer 'REAS' do
    name 'Casey Reas'
    roles 'developer'
  end

  developer 'codeanticode' do
    name 'Andres Colubri'
    roles 'developer'
  end

  issue_management 'https://github.com/ruby-processing/processing/issues', 'Github'

  source_control( :url => 'https://github.com/ruby-processing/processing',
                  :connection => 'scm:git:git://github.com/ruby-processing/processing.git',
                  :developer_connection => 'scm:git:git@github.com/ruby-processing/processing.git' )

  properties( 'processing.api' => 'http://processing.github.io/processing-javadocs/core/',
              'processing.basedir' => '${project.basedir}',
              'source.directory' => 'src',
              'polyglot.dump.pom' => 'pom.xml',
              'project.build.sourceEncoding' => 'utf-8',
              'jogl.version' => '2.3.2',
              'jruby.api' => 'http://jruby.org/apidocs/' )

  pom 'org.jruby:jruby:9.2.7.0'
  jar 'org.processing:video:3.2.3'
  jar 'org.jogamp.jogl:jogl-all:${jogl.version}'
  jar 'org.jogamp.gluegen:gluegen-rt-main:${jogl.version}'

  overrides do
    plugin( 'org.codehaus.mojo:versions-maven-plugin:2.7',
            'generateBackupPoms' =>  'false' )
    plugin( :compiler, '3.8.0',
            'release' =>  '11' )
    plugin( :javadoc, '3.0.1',
            'detectOfflineLinks' =>  'false',
            'links' => [ '${jruby.api}',
                         '${processing.api}' ] )
    plugin( :jar, '3.1.0',
            'archive' => {
              'manifestFile' =>  'MANIFEST.MF'
            } )
  end


  build do

    resource do
      directory '${source.directory}/main/java'
      includes '**/**/*.glsl', '**/*.jnilib'
      excludes '**/**/*.java'
    end

    resource do
      directory '${source.directory}/main/resources'
      includes '**/*.png', '*.txt'
      excludes 
    end
  end

end
