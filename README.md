<h1 align="center">
      MySQL_Restaurant_Database
      <br />
      <hr />
      Restaurant Reservations, Deliveries, and Orders Database
    </h1>
    <h3>Specifications for the Fictional Company:</h3>
    <ol>
      <li><h4>General Overview:</h4></li>
      <p>
        The company manages information about reservations, deliveries, and
        orders for a restaurant, all of which contribute to generating profit.
      </p>
      <li><h4>Reservations:</h4></li>
      <ul>
        <li>
          Reservation ID (IdReservation): Each reservation has a unique ID.
        </li>
        <li>Attributes:</li>
        <ul>
          <li>Deposit payment status.</li>
          <li>Date and time of the reservation.</li>
          <li>Client's name under whom the reservation is made.</li>
          <li>Employee's name responsible for making the reservation.</li>
        </ul>
        <li>
          A single reservation (IdReservation) is made in the name of one
          client.
        </li>
        <li>A client can make multiple reservations, each with a unique ID.</li>
        <li>Cancellations:</li>
        <ul>
          <li>Reason for cancellation.</li>
          <li>Cancellation penalty applied.</li>
        </ul>
        <li>Venue (room):</li>
        <ul>
          <li>Each room is rented to one client at a time.</li>
          <li>Attributes of the venue:</li>
          <ul>
            <li>Name of the venue.</li>
            <li>Capacity.</li>
            <li>Rental price.</li>
            <li>Client details associated with the reservation.</li>
          </ul>
        </ul>
      </ul>
      <li><h4>Clients:</h4></li>
      <ul>
        <li>Attributes:</li>
        <ul>
          <li>Unique Client ID (IdClient).</li>
          <li>Name of the client.</li>
          <li>Address.</li>
          <li>Phone number.</li>
        </ul>
        <li>A client can make multiple reservations and multiple orders.</li>
      </ul>
      <li><h4>Orders:</h4></li>
      <ul>
        <li>Order ID (IdOrder): Each order has a unique ID.</li>
        <li>Attributes:</li>
        <ul>
          <li>Multiple products in the cart.</li>
          <li>Total price.</li>
          <li>Date of the order.</li>
          <li>Client ID of the customer who placed the order.</li>
        </ul>
      </ul>
      <li><h4>Products:</h4></li>
      <ul>
        <li>Attributes:</li>
        <ul>
          <li>Unique Product ID (IdProduct).</li>
          <li>Product name.</li>
          <li>Price.</li>
          <li>Menu to which the product belongs.</li>
          <li>Delivery ID (IdDelivery), if the order is a takeaway.</li>
        </ul>
      </ul>
      <li><h4>Menus:</h4></li>
      <ul>
        <li>
          Each menu has a unique name (e.g., "Fresh Tuna Salad", "Meatball
          Soup", "Chicken and Bacon Pasta").
        </li>
        <li>
          A menu consists of multiple products (e.g., Italian, Greek, Chinese).
        </li>
      </ul>
      <li><h4>Deliveries:</h4></li>
      <ul>
        <li>Delivery ID (IdDelivery): Each delivery has a unique ID.</li>
        <li>Attributes:</li>
        <ul>
          <li>Date and time of delivery.</li>
          <li>Employee responsible for the delivery.</li>
        </ul>
        <li>A delivery is based on an order.</li>
      </ul>
      <li><h4>Employees:</h4></li>
      <ul>
        <li>Attributes:</li>
        <ul>
          <li>Name.</li>
          <li>Phone number.</li>
          <li>Role (e.g., driver, waiter, cook, cashier).</li>
          <li>Salary.</li>
        </ul>
        <li>Employees can:</li>
        <ul>
          <li>Handle reservations for clients.</li>
          <li>Perform deliveries.</li>
        </ul>
      </ul>
      <li><h4>Cashier Transactions:</h4></li>
      <ul>
        <li>Attributes:</li>
        <ul>
          <li>Amount of the transaction.</li>
          <li>Date and time of the transaction.</li>
          <li>Employee responsible for the transaction.</li>
        </ul>
        <li>All deliveries and orders are recorded in the cash register.</li>
      </ul>
    </ol>
