
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
#     The "item(index)" method returns the indexth item in 
#    the map(test for first item). 
#    
#    Retrieve the second "acronym" get the NamedNodeMap of the attributes. Since the
#    DOM does not specify an order of these nodes the contents
#    of the FIRST node can contain either "title", "class" or "dir".
# @author Curt Arnold
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-349467F9]
# see[http://www.w3.org/Bugs/Public/show_bug.cgi?id=236]
# see[http://lists.w3.org/Archives/Public/www-dom-ts/2003Jun/0011.html]
# see[http://www.w3.org/Bugs/Public/show_bug.cgi?id=184]
##
DOMTestCase('hc_namednodemapreturnfirstitem') do

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
    preload(contentType, "hc_staff", true)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_hc_namednodemapreturnfirstitem
    doc = nil
    elementList = nil
    testAddress = nil
    attributes = nil
    child = nil
    nodeName = nil
    htmlExpected = []
      htmlExpected << "title"
      htmlExpected << "class"
      
    expected = []
      expected << "title"
      expected << "class"
      expected << "dir"
      
    actual = []
      
    doc = load_document("hc_staff", true)
      elementList = doc.getElementsByTagName("acronym")
      testAddress = elementList.item(1)
      attributes = testAddress.attributes()
      indexid3698336 = 0
    while (indexid3698336 < attributes.length)
      child = attributes.item(indexid3698336)
    nodeName = child.nodeName()
      actual << nodeName
      indexid3698336 += 1
            end
      
      if (("text/html" == getContentType()))
        assertEqualsIgnoreCase("attrName_html", htmlExpected, actual)

          else
            assert_equal(expected, actual, "attrName")
            
         end
       
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/hc_namednodemapreturnfirstitem"
  end
end

