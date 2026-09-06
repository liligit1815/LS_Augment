.class Lcom/android/quickstep/FallbackSwipeHandler$FallbackPipToHomeAnimationFactory;
.super Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;
.source "FallbackSwipeHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/FallbackSwipeHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FallbackPipToHomeAnimationFactory"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/FallbackSwipeHandler;


# direct methods
.method private constructor <init>(Lcom/android/quickstep/FallbackSwipeHandler;)V
    .locals 0

    .line 2
    iput-object p1, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackPipToHomeAnimationFactory;->this$0:Lcom/android/quickstep/FallbackSwipeHandler;

    invoke-direct {p0, p1}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;-><init>(Lcom/android/quickstep/SwipeUpAnimationLogic;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/quickstep/FallbackSwipeHandler;Lcom/android/quickstep/Z0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/FallbackSwipeHandler$FallbackPipToHomeAnimationFactory;-><init>(Lcom/android/quickstep/FallbackSwipeHandler;)V

    return-void
.end method


# virtual methods
.method public createActivityAnimationToHome()Lcom/android/launcher3/anim/q;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackPipToHomeAnimationFactory;->this$0:Lcom/android/quickstep/FallbackSwipeHandler;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 4
    .line 5
    iget v1, v0, Lcom/android/launcher3/h0;->T0:I

    .line 6
    .line 7
    iget v0, v0, Lcom/android/launcher3/h0;->U0:I

    .line 8
    .line 9
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    mul-int/lit8 v0, v0, 0x2

    .line 14
    .line 15
    int-to-long v0, v0

    .line 16
    iget-object p0, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackPipToHomeAnimationFactory;->this$0:Lcom/android/quickstep/FallbackSwipeHandler;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 19
    .line 20
    check-cast p0, Lcom/android/quickstep/RecentsActivity;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsActivity;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    sget-object v2, Lcom/android/quickstep/fallback/RecentsState;->HOME:Lcom/android/quickstep/fallback/RecentsState;

    .line 27
    .line 28
    const/4 v3, 0x1

    .line 29
    invoke-virtual {p0, v2, v0, v1, v3}, Lcom/android/launcher3/statemanager/d;->o(Lcom/android/launcher3/statemanager/a;JI)Lcom/android/launcher3/anim/q;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method
