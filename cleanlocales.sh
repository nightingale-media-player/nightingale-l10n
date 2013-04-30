#!/bin/sh
# Skript for cleaning up locale files, solves layout issues

echo Format DTD files.
find locales -iname '*.dtd' | while read DTD;
do
  cat $DTD | sed -r -e 's/^<!ENTITY[ ]+([a-zA-Z0-9\.]+)[ ]+["'\'']([^"'\'']*)["'\''][ ]*>$/<!ENTITY \1 "\2">/g' > $DTD.clean
	rm $DTD
	mv $DTD.clean $DTD
done

echo Format Properties files.
find locales -iname '*.properties' | while read Prop;
do
  cat $Prop | sed -r -e 's/^([a-zA-Z0-9\.]+)[ ]*=(.*)$/\1=\2/g' > $Prop.clean
	rm $Prop
	mv $Prop.clean $Prop
done