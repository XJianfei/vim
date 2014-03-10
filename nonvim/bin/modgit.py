#!/usr/bin/env python

import os
import sys
import subprocess

def main(argv):
    suversion = ""
    cwd = ""
    
    if len(sys.argv) > 1:
        cwd = os.getcwd()
        os.chdir(sys.argv[1])
    cmd = []
    cmd = ["git", "log", "-1", "--pretty=%h"]
    p = subprocess.Popen(cmd, stdout = subprocess.PIPE)
    pout = p.communicate()
    suversion = pout[0]
    suversion = "".join(suversion.split())
    
    print "%s" % suversion
    
    AMXML='AndroidManifest.xml'
    AMBAK='AndroidManifest.xml.old'
    AMTEMP="temp"
    
    if len(sys.argv) > 1:
        AMXML = sys.argv[1] + '/' + AMXML
        AMBAK = sys.argv[1] + '/' + AMBAK
        AMTEMP = sys.argv[1] + '/' + AMTEMP
        os.chdir(cwd)
    
    print "%s  %s" % (AMXML, AMBAK)
    
    
    data = open(AMXML).read()
    
    #print data
    
    has_version=0
    package_line=-1
    fp = open(AMBAK, "w+")
    lines = []
    version="1.0"
    i = 0
    for l in data.split("\n"):
        if l.find("android:versionName=") != -1:
            vv = l.split('"')
            vs = vv[1].split('-')
            version = vs[0]
            if len(vs) != 1:
                file_suversion = vs[len(vs) - 1]
                if cmp(file_suversion, suversion) == 0:
                    print "same"
                    fp.close();
                    os.remove(AMBAK)
                    sys.exit(0)
                l = l.replace(file_suversion, suversion)
            else:
                l = l.replace(version, version + '-' +  suversion)
            has_version=1
        if l.find("package=") != -1:
            if package_line == -1:
                package_line = i;
    
        lines.append(l)
        i = i + 1
        
    i = 0
    print "version: %s" % version
    print "sufix version: %s" % suversion
    for l in lines:
        if has_version == 0 and i == package_line:
            fp.write('android:versionName="' + version + '-' + suversion + '"\n' )
        fp.write(l + "\n")
        i = i + 1
    fp.close()
    
    os.rename(AMXML, AMTEMP)
    os.rename(AMBAK, AMXML)
    os.rename(AMTEMP, AMBAK)
    #os.remove(AMBAK)


if __name__ == "__main__":
  main(sys.argv)
