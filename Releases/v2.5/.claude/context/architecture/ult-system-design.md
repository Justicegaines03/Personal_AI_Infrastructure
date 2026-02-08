# System Architecture Patterns

## Ultimate System Design Principles

1. Layered Architecture
Separate the Application into Three Layers:

Presentation Layer: Responsible for the UI. Contains views, components, and interface logic. Should not contain domain/business logic.

Application (Business Logic) Layer: The core of the application. Contains domain logic, state management, computations, and rules. Stays independent of UI and infrastructure details.

Infrastructure Layer: Handles integration with external systems (e.g., APIs, storage, logging, environment config). Supplies data and utilities to the business logic layer.

2. Direction of Dependencies
Core Logic is the Center:
All dependencies point inward to the application layer. The core logic does not import or depend directly on presentation or infrastructure.

Outer Layers Depend on the Core:
The UI and infrastructure layers depend on and use the core application logic, but never the other way around.

3. Dependency Injection
Inject Services, Don’t Hardcode:
Use dependency injection to provide infrastructure services and utilities (APIs, logging, etc.) to the application layer.

Configure Entry Points:
Inject dependencies in the application’s entry point, allowing for easy swapping, mocking, or adapting services per environment (dev, prod, test).

4. Platform Agnosticism
Write Portable Application Logic:
Design the application layer so that it contains no platform-specific code. This approach enables reuse and portability across web, mobile, desktop, or other UIs.

5. Testability and Flexibility
Prioritize Testability:
Keep business logic decoupled from frameworks and infrastructure for easier and more effective unit testing. Use mocks/stubs for dependencies in tests.

Embrace Change:
Support future changes in UI and infrastructure by adhering to contracts/interfaces between layers, minimizing the ripple effect of change.

6. Clear Contracts & Data Flow
Define Explicit Contracts:
Layers communicate via clearly defined interfaces, action types, or service contracts.

Predictable Data Flow:
Use unidirectional patterns (e.g., Redux, CQRS) within the application/business layer to make data flow traceable and debugging straightforward.

7. Scalability & Modularity
Design for Extension:
Organize code so it’s straightforward to add new features, swap out technologies, or scale to new requirements without major rewrites.

Modular Folders & Files:
Structure codebases so each layer’s code is self-contained and discoverable (e.g., /application, /infrastructure, /presentation).