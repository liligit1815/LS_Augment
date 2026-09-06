.class Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$2;
.super Landroid/view/ViewOutlineProvider;
.source "SwipeUpGestureTutorialController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;-><init>(Lcom/android/quickstep/interaction/TutorialFragment;Lcom/android/quickstep/interaction/TutorialController$TutorialType;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;


# direct methods
.method constructor <init>(Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$2;->this$0:Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$2;->this$0:Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->m(Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;)Landroid/graphics/Rect;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$2;->this$0:Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->l(Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;)F

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-virtual {p2, p1, p0}, Landroid/graphics/Outline;->setRoundRect(Landroid/graphics/Rect;F)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
