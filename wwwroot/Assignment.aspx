﻿<!-- Copyright by Indiana University Purdue University Indianapolis
  -- School of Computer & Informatic Science
  -- Dian Wen & Rui Wang
  -- 2013 Jan-May
-->

<%@ Page Title="Assignment" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" EnableEventValidation ="false"
    CodeFile="Assignment.aspx.cs" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Label ID="SearchMsg" CssClass="form lable" runat="server">Search by: </asp:Label>
    <asp:DropDownList ID="SearchArea"  runat="server">
        <asp:ListItem Value="JID">JudgeID</asp:ListItem>
        <asp:ListItem Value="PID">ProjectID</asp:ListItem>
        <asp:ListItem Value="AID">AissgnmentID</asp:ListItem>
    </asp:DropDownList>
    <asp:TextBox ID="SearchTxt" OnTextChanged="getAssignment" runat="server"></asp:TextBox>
    <asp:Button ID="search" class="button"  Visible="true" Text="Search" runat="server" onclick="getAssignment" />
    <asp:RegularExpressionValidator ID="checkuname" runat="server" ErrorMessage="Incorrect, must be between 1-10 bits letters or numbers ." ControlToValidate="SearchTxt" ValidationExpression="[a-zA-Z0-9]{1,10}" />

    <asp:Button ID="Print" class="button" Visible="true" Text="Print" runat="server" onclick="PrintAllPages" />
       <asp:Panel ID="PnlTable" runat="server">
       <asp:GridView ID="Grid1" runat="server" PageSize="20" AutoGenerateColumns="False" AllowPaging="true" 
           OnPageIndexChanging="PageIndexChanging" AutoGenerateDeleteButton="true"
           OnRowDeleting="Grid1_RowDeleting" DataKeyNames="AID,periodID,JudgeID,ProjectID">
            <columns>
            
            <asp:templatefield headertext="AssignNo." ItemStyle-Width="20">
                <itemtemplate>
                    <asp:label id="aid" runat='server' Text='<%#Eval("AID") %>'/>                  
                </itemtemplate>
            </asp:templatefield>

           <asp:templatefield headertext="Period"><itemtemplate><%#Eval("periodID") %> </itemtemplate>
           <edititemtemplate>
                 <asp:label id="periodid" runat='server' Text='<%#Eval("periodID") %>'/> 

           </edititemtemplate>
           </asp:templatefield>
            
            <asp:templatefield headertext="JudgeID"><itemtemplate><%#Eval("JudgeID") %> </itemtemplate>
           <edititemtemplate>
           <asp:label id="jid" runat='server' Text='<%#Eval("JudgeID") %>'/> 
           </edititemtemplate>
            </asp:templatefield>

           <asp:templatefield headertext="Judge Name">
                <itemtemplate>
                    <asp:label id="jname" runat='server' Text='<%#Eval("Judge_Name") %>'/>                  
                </itemtemplate>
            </asp:templatefield>
                            
            <asp:templatefield headertext="ProjectID"><itemtemplate><%#Eval("ProjectID") %> </itemtemplate>
           <edititemtemplate>
           <asp:label id="pid" runat='server' Text='<%#Eval("ProjectID") %>'/> 

           </edititemtemplate>
            </asp:templatefield>

            <asp:templatefield headertext="Student Name">
                <itemtemplate>
                    <asp:label id="sname" runat='server' Text='<%#Eval("Stu_Name") %>'/>                  
                </itemtemplate>
            </asp:templatefield>

            <asp:templatefield headertext="Project Name">
                <itemtemplate>
                    <asp:label id="projname" runat='server' Text='<%#Eval("Proj_Name") %>'/>                  
                </itemtemplate>
            </asp:templatefield>

            </columns>

           <PagerTemplate>
                <table align="right" bgcolor="#e9e9e9" width="100%">
                    <tr>
                        <td style="text-align: right">
                            Page <b><asp:Label ID="lblPageIndex" runat="server" Text="<%#((GridView)Container.Parent.Parent).PageIndex + 1 %>"></asp:Label></b>
                            of <b><asp:Label ID="lblPageCount" runat="server" Text="<%# ((GridView)Container.Parent.Parent).PageCount %>"></asp:Label></b>
                            <asp:LinkButton ID="btnFirst" runat="server" CausesValidation="False" CommandArgument="First"
                                CommandName="Page" Enabled="<%# ((GridView)Container.NamingContainer).PageIndex != 0 %>"
                                Text="First  "></asp:LinkButton>
                            <asp:LinkButton ID="btnPrev" runat="server" CausesValidation="False" CommandArgument="Prev"
                                CommandName="Page" Enabled=" <%# ((GridView)Container.NamingContainer).PageIndex != 0 %>"
                                Text="<< Previous  "></asp:LinkButton>
                            <asp:LinkButton ID="btnNext" runat="server" CausesValidation="False" CommandArgument="Next"
                                CommandName="Page" Enabled=" <%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>"
                                Text="  Next >>"></asp:LinkButton>
                            <asp:LinkButton ID="btnLast" runat="server" CausesValidation="False" CommandArgument="Last"
                                CommandName="Page" Enabled=" <%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>"
                                Text="  Last"></asp:LinkButton>
                            <asp:TextBox ID="txtNewPageIndex" runat="server" Text="<%# ((GridView)Container.Parent.Parent).PageIndex + 1%>"
                                Width="20px"></asp:TextBox>
                            <asp:LinkButton ID="btnGo" runat="server" CausesValidation="false" CommandArgument="-1"
                                CommandName="Page" Text="GO"></asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </PagerTemplate>
       </asp:GridView>
   </asp:Panel>
</asp:Content>
