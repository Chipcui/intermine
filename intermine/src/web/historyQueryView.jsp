<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html-el.tld" prefix="html" %>

<!-- historyQueryView.jsp -->
<c:if test="${!empty SAVED_QUERIES}">
  <html:form action="/modifyQuery">
    <fmt:message key="query.savedqueries.header"/>
    <br/><br/>
    <table class="results" cellspacing="0">
      <tr>
        <th>
          &nbsp;
        </th>
        <th align="left">
          <fmt:message key="query.savedqueries.namecolumnheader"/>
        </th>
        <th align="right">
          <fmt:message key="query.savedqueries.countcolumnheader"/>
        </th>
      </tr>
      <c:forEach items="${SAVED_QUERIES}" var="savedQuery">
        <tr>
          <td>
            <html:multibox property="selectedQueries">
              <c:out value="${savedQuery.key}"/>
            </html:multibox>
          </td>
          <td align="left">
            <html:link action="/modifyQueryChange?method=load&name=${savedQuery.key}">
              <c:out value="${savedQuery.key}"/>
            </html:link>
          </td>
          <td align="right">
            <c:if test="${savedQuery.value.resultsInfo != null}">
              <c:out value="${savedQuery.value.resultsInfo.rows}"/>
            </c:if>
          </td>
        </tr>
      </c:forEach>
    </table>
    <br/>
    <html:submit property="delete">
      <fmt:message key="history.delete"/>
    </html:submit>
    <html:submit property="export">
      <fmt:message key="history.export"/>
    </html:submit>
  </html:form>
</c:if>
<!-- /historyQueryView.jsp -->
