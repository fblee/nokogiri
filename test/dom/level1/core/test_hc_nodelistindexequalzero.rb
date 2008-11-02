
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin

Copyright (c) 2001-2003 World Wide Web Consortium,
(Massachusetts Institute of Technology, Institut National de
Recherche en Informatique et en Automatique, Keio University). All
Rights Reserved. This program is distributed under the W3C's Software
Intellectual Property License. This program is distributed in the
hope that it will be useful, but WITHOUT ANY WARRANTY; without even
the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
PURPOSE.
See W3C License http://www.w3.org/Consortium/Legal/ for more details.

=end
#

require 'dom_test_case'

###
#    Create a list of all the children elements of the third
#    employee and access its first child by using an index
#    of 0.  This should result in the whitspace before "em" being
#    selected (em when ignoring whitespace).  
#    Further we evaluate its content(by using
#    the "getNodeName()" method) to ensure the proper
#    element was accessed.
# @author Curt Arnold
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-844377136]
# see[http://www.w3.org/Bugs/Public/show_bug.cgi?id=246]
##
DOMTestCase('hc_nodelistindexequalzero') do

  ###
  # Constructor.
  # @param factory document factory, may not be null
  # @throws org.w3c.domts.DOMTestIncompatibleException Thrown if test is not compatible with parser configuration
  ##
  def setup
    ##
    ##   check if loaded documents are supported for content type
    ##
    contentType = getContentType()
    preload(contentType, "hc_staff", false)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_hc_nodelistindexequalzero
    doc = nil
    elementList = nil
    employeeNode = nil
    employeeList = nil
    child = nil
    childName = nil
    length = nil
    doc = load_document("hc_staff", false)
      elementList = doc.getElementsByTagName("p")
      employeeNode = elementList.item(2)
      employeeList = employeeNode.childNodes()
      length = employeeList.length()
      child = employeeList.item(0)
      childName = child.nodeName()
      
      if (equals(13, length))
        assert_equal("#text", childName, "childName_w_whitespace")
            
          else
            assertEqualsAutoCase("element", "childName_wo_whitespace", "em", childName)
        
         end
       
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/hc_nodelistindexequalzero"
  end
end

