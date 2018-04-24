--E.G Cleaning Projects
--Update 2018/04/23

-- -----------------------------------------------------
-- Table ZipCode - E.G.
-- -----------------------------------------------------
CREATE TABLE ZipCode (
  PostalCode        VARCHAR(7)        NOT NULL,
  PostalCity        VARCHAR(20)       NOT NULL,
  PostalRegion      VARCHAR(20)       NOT NULL,
  
  PRIMARY KEY (PostalCode)

)
;

-- -----------------------------------------------------
-- Table Customers - E.G.
-- -----------------------------------------------------
CREATE TABLE Customers (
  CustId                INT           AUTO_INCREMENT,
  CustFirstNam          VARCHAR(25)   NOT NULL,
  CustLastNam           VARCHAR(25)   NOT NULL,
  CustStreet            VARCHAR(25)   NOT NULL,
  CustPhone             VARCHAR(15)   NOT NULL,
  PostalCode            VARCHAR(7)    NOT NULL,
  CustEmail             VARCHAR(50)   NULL,

  PRIMARY KEY (CustId),

  CONSTRAINT fk_Customer_PostalCode
    FOREIGN KEY (PostalCode)
    REFERENCES ZipCode (PostalCode)
)
;

-- -----------------------------------------------------
-- Table Category E.G.
-- -----------------------------------------------------
CREATE TABLE Category (
  CategoryId        VARCHAR(3)      NOT NULL,
  CategoryDesc      VARCHAR(40)     NOT NULL,
  
  PRIMARY KEY (CategoryId)

  CONSTRAINT un_Category_Desc
  UNIQUE (CategoryId)
)
;

-- -----------------------------------------------------
-- Table Services E.G.
-- -----------------------------------------------------
CREATE TABLE Services (
  ServId            INT             NOT NULL,
  ServDesc          VARCHAR(60)     NOT NULL,
  Price             DECIMAL(6,2)    NOT NULL,
  Category          INT             NOT NULL,
  
  PRIMARY KEY (ServId),

  CONSTRAINT un_Desc_Services
  UNIQUE (ServDesc),

  CONSTRAINT ck_Price_Services
  CHECK (Price > 60),

  CONSTRAINT fk_CategoryId_Desc
    FOREIGN KEY (Category)
    REFERENCES Category(CategoryID)

)
;

-- -----------------------------------------------------
-- Table Positions E.G.
-- -----------------------------------------------------
CREATE TABLE Positions (
  PositionId        INT             NOT NULL AUTO_INCREMENT,
  PositionDesc      VARCHAR(20)     NOT NULL,
  Salary            DECIMAL(4,2)    NOT NULL,
  
  PRIMARY KEY (PositionId)
)
;

-- -----------------------------------------------------
-- Table Employees E.G.
-- -----------------------------------------------------
CREATE TABLE Employees (
  EmpId             INT             NOT NULL AUTO_INCREMENT,
  EmpFirstNam       VARCHAR(25)     NOT NULL,
  EmpLastNam        VARCHAR(25)     NOT NULL,
  EmpStreet         VARCHAR(25)     NOT NULL,
  EmpPostalCode     VARCHAR(7)      NOT NULL,
  PositionId        INT             NOT NULL,
  SinNum            DECIMAL(10)     NOT NULL,
  StartDate         DATE            NOT NULL,
  Email             VARCHAR(50)     DEFAULT 'NONE',

  PRIMARY KEY (EmpId),

  CONSTRAINT fk_Employee_PositionInCompany
    FOREIGN KEY (PositionId)
    REFERENCES Positions (PositionId),

  CONSTRAINT ck_SinNum_Employee
  CHECK (SinNum between 0 and 999999999),

  CONSTRAINT fk_Employee_ZipCode
    FOREIGN KEY (EmpPostalCode)
    REFERENCES ZipCode (PostalCode)
)
;

-- -----------------------------------------------------
-- Table Invoices E.G.
-- ALTER TABLE INVOICES AUTO_INCREMENT = 100;
-- -----------------------------------------------------
CREATE TABLE Invoices (
  InvoiceId         INT(100)      NOT NULL AUTO_INCREMENT,
  CustomerID        INT           NOT NULL,
  Received          VARCHAR(10)   DEFAULT 'NOT PAID',
  InvoiceDate       DATE          NOT NULL,
  Notes             VARCHAR(200)  NULL,
  Taxes             TINYINT(1)    NOT NULL DEFAULT 0,
  
  
  PRIMARY KEY (InvoiceId),
  
  CONSTRAINT fk_CustomerName_Customer
    FOREIGN KEY (CustomerID)
    REFERENCES Customers (CustId),

  CONSTRAINT ck_Received_TypeReceived
  CHECK (Received IN ('NOT PAID', 'E-Transfer', 'Cash', 'Cheque', 'Bitcoin', 'Weed'))
)
;

-- -----------------------------------------------------
-- Table ServiceInvoices E.G.
-- -----------------------------------------------------
CREATE TABLE ServiceInvoices (
  InvoiceID           INT           NOT NULL,
  LineId              INT           NOT NULL,
  ServID              INT           NOT NULL,
  EmpID               INT           NOT NULL,
  ServiceDate         DATE          NOT NULL,
  ServiceQty          DECIMAL(4,2)  NOT NULL,
  
  

  PRIMARY KEY (InvoiceID, LineId),

  CONSTRAINT fk_InvoiceService_Invoice
    FOREIGN KEY (InvoiceID)
    REFERENCES Invoices (InvoiceId),

  CONSTRAINT fk_Service_Done
    FOREIGN KEY (ServId)
    REFERENCES Services (ServId),

  CONSTRAINT fk_Employee_empName
    FOREIGN KEY (EmpID)
    REFERENCES Employees (EmpId)
  
)
;
























-- DEVELOPING


-- -----------------------------------------------------
-- Table expenses E.G. 
-- -----------------------------------------------------
CREATE TABLE expenses (

  expId     int          NOT NULL AUTO_INCREMENT,
  expDesc   VARCHAR(200) NOT NULL,
  provider  VARCHAR(40)  NOT NULL,
  expPrice  DECIMAL(5,2) NOT NULL,
  expDate   date         NOT NULL,

  PRIMARY KEY (expId)

)
;















