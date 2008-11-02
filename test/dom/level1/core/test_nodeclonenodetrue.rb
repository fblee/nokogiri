
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin

Copyright (c) 2001-2004 World Wide Web Consortium,
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
#     The "cloneNode(deep)" method returns a copy of the node
#     and the subtree under it if deep=true.
#     
#     Retrieve the second employee and invoke the
#     "cloneNode(deep)" method with deep=true.   The
#     method should clone this node and the subtree under it.
#     The NodeName of each child in the returned node is 
#     checked to insure the entire subtree under the second
#     employee was cloned.
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-3A0ED0A4]
##
DOMTestCase('nodeclonenodetrue') do

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
    preload(contentType, "staff", true)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_nodeclonenodetrue
    doc = nil
    elementList = nil
    employeeNode = nil
    childList = nil
    clonedNode = nil
    clonedList = nil
    clonedChild = nil
    clonedChildName = nil
    length = nil
    result = []
      
    expectedWhitespace = []
      expectedWhitespace << "#text"
      expectedWhitespace << "employeeId"
      expectedWhitespace << "#text"
      expectedWhitespace << "name"
      expectedWhitespace << "#text"
      expectedWhitespace << "position"
      expectedWhitespace << "#text"
      expectedWhitespace << "salary"
      expectedWhitespace << "#text"
      expectedWhitespace << "gender"
      expectedWhitespace << "#text"
      expectedWhitespace << "address"
      expectedWhitespace << "#text"
      
    expectedNoWhitespace = []
      expectedNoWhitespace << "employeeId"
      expectedNoWhitespace << "name"
      expectedNoWhitespace << "position"
      expectedNoWhitespace << "salary"
      expectedNoWhitespace << "gender"
      expectedNoWhitespace << "address"
      
    doc = load_document("staff", true)
      elementList = doc.getElementsByTagName("employee")
      employeeNode = elementList.item(1)
      childList = employeeNode.childNodes()
      length = childList.length()
      clonedNode = employeeNode.cloneNode(true)
      clonedList = clonedNode.childNodes()
      indexid5458430 = 0
    while (indexid5458430 < clonedList.length)
      clonedChild = clonedList.item(indexid5458430)
    clonedChildName = clonedChild.nodeName()
      result << clonedChildName
      indexid5458430 += 1
            end
      
      if (equals(6, length))
        assert_equal(expectedNoWhitespace, result, "nowhitespace")
            
          else
            assert_equal(expectedWhitespace, result, "whitespace")
            
         end
       
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/nodeclonenodetrue"
  end
end

