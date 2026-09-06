.class public final synthetic Lcom/android/quickstep/S6;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/TouchInteractionService$TISBinder;

.field public final synthetic b:Z

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/TouchInteractionService$TISBinder;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/S6;->a:Lcom/android/quickstep/TouchInteractionService$TISBinder;

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/android/quickstep/S6;->b:Z

    .line 7
    .line 8
    iput-boolean p3, p0, Lcom/android/quickstep/S6;->c:Z

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/S6;->a:Lcom/android/quickstep/TouchInteractionService$TISBinder;

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/quickstep/S6;->b:Z

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/android/quickstep/S6;->c:Z

    .line 6
    .line 7
    check-cast p1, Lcom/android/quickstep/TouchInteractionService;

    .line 8
    .line 9
    invoke-static {v0, v1, p0, p1}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->N2(Lcom/android/quickstep/TouchInteractionService$TISBinder;ZZLcom/android/quickstep/TouchInteractionService;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
