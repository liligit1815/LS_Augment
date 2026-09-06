.class public final synthetic Lcom/android/quickstep/k6;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/quickstep/AbsSwipeUpHandler$Factory;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/TouchInteractionService;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/TouchInteractionService;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/k6;->a:Lcom/android/quickstep/TouchInteractionService;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final newHandler(Lcom/android/quickstep/GestureState;J)Lcom/android/quickstep/AbsSwipeUpHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/k6;->a:Lcom/android/quickstep/TouchInteractionService;

    .line 2
    .line 3
    invoke-static {p0, p1, p2, p3}, Lcom/android/quickstep/TouchInteractionService;->a(Lcom/android/quickstep/TouchInteractionService;Lcom/android/quickstep/GestureState;J)Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
