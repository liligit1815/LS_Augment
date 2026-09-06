.class Lcom/android/quickstep/touch/TaskWindowSpringScrollController$4;
.super Ljava/lang/Object;
.source "TaskWindowSpringScrollController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->handleUpdateDisplacementWithShift(F)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/touch/TaskWindowSpringScrollController;

.field final synthetic val$shift:F


# direct methods
.method constructor <init>(Lcom/android/quickstep/touch/TaskWindowSpringScrollController;F)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$4;->this$0:Lcom/android/quickstep/touch/TaskWindowSpringScrollController;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$4;->val$shift:F

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$4;->this$0:Lcom/android/quickstep/touch/TaskWindowSpringScrollController;

    .line 2
    .line 3
    iget p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$4;->val$shift:F

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->handleUpdateDisplacementWithShift$lambda$22(Lcom/android/quickstep/touch/TaskWindowSpringScrollController;F)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
