
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin

Copyright (c) 2001 World Wide Web Consortium,
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
#     The "insertData(offset,arg)" method will insert a string 
#    at the specified character offset.  Insert the data in 
#    the middle of the character data. 
#    
#    Retrieve the character data from the second child of  
#    the first employee.  The "insertData(offset,arg)"
#    method is then called with offset=9 and arg="Ann".
#    The method should insert the string "Ann" at position 9.
#    The new value of the character data should be
#    "Margaret Ann Martin".
# @author Curt Arnold
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-72AB8359]
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-3EDB695F]
##
DOMTestCase('hc_characterdatainsertdatamiddle') do

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
  def test_hc_characterdatainsertdatamiddle
    doc = nil
    elementList = nil
    nameNode = nil
    child = nil
    childData = nil
    doc = load_document("hc_staff", true)
      elementList = doc.getElementsByTagName("strong")
      nameNode = elementList.item(0)
      child = nameNode.firstChild()
      child.insertData(9, "Ann ")
      childData = child.data()
      assert_equal("Margaret Ann Martin", childData, "characterdataInsertDataMiddleAssert")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/hc_characterdatainsertdatamiddle"
  end
end

