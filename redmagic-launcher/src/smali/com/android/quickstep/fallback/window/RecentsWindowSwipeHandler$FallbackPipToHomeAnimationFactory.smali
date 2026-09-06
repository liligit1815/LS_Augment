.class Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$FallbackPipToHomeAnimationFactory;
.super Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;
.source "RecentsWindowSwipeHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FallbackPipToHomeAnimationFactory"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;


# direct methods
.method private constructor <init>(Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;)V
    .locals 0

    .line 2
    iput-object p1, p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$FallbackPipToHomeAnimationFactory;->this$0:Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;

    invoke-direct {p0, p1}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;-><init>(Lcom/android/quickstep/SwipeUpAnimationLogic;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;Lcom/android/quickstep/fallback/window/w;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$FallbackPipToHomeAnimationFactory;-><init>(Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;)V

    return-void
.end method


# virtual methods
.method public createActivityAnimationToHome()Lcom/android/launcher3/anim/q;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$FallbackPipToHomeAnimationFactory;->this$0:Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;->access$000(Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;)Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v0, v0, Lcom/android/launcher3/h0;->T0:I

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$FallbackPipToHomeAnimationFactory;->this$0:Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;

    .line 10
    .line 11
    invoke-static {v1}, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;->access$100(Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;)Lcom/android/launcher3/h0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget v1, v1, Lcom/android/launcher3/h0;->U0:I

    .line 16
    .line 17
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    mul-int/lit8 v0, v0, 0x2

    .line 22
    .line 23
    int-to-long v0, v0

    .line 24
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$FallbackPipToHomeAnimationFactory;->this$0:Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 27
    .line 28
    check-cast p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    sget-object v2, Lcom/android/quickstep/fallback/RecentsState;->HOME:Lcom/android/quickstep/fallback/RecentsState;

    .line 35
    .line 36
    const/4 v3, 0x1

    .line 37
    invoke-virtual {p0, v2, v0, v1, v3}, Lcom/android/launcher3/statemanager/d;->o(Lcom/android/launcher3/statemanager/a;JI)Lcom/android/launcher3/anim/q;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method
