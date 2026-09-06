.class Lcom/android/quickstep/touch/TaskWindowSpringScrollController$2;
.super Ljava/lang/Object;
.source "TaskWindowSpringScrollController.java"

# interfaces
.implements Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/touch/TaskWindowSpringScrollController;-><init>(Lcom/android/quickstep/TaskAnimationManager;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/touch/TaskWindowSpringScrollController;


# direct methods
.method constructor <init>(Lcom/android/quickstep/touch/TaskWindowSpringScrollController;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$2;->this$0:Lcom/android/quickstep/touch/TaskWindowSpringScrollController;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Lcom/android/quickstep/util/animation/DynamicAnimation;FF)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$2;->this$0:Lcom/android/quickstep/touch/TaskWindowSpringScrollController;

    .line 2
    .line 3
    invoke-static {p0, p1, p2, p3}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->scrollYUpdateListener$lambda$3(Lcom/android/quickstep/touch/TaskWindowSpringScrollController;Lcom/android/quickstep/util/animation/DynamicAnimation;FF)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
