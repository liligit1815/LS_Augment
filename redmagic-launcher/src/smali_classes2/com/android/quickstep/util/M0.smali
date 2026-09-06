.class public final synthetic Lcom/android/quickstep/util/M0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/views/TaskContainer;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/views/TaskContainer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/M0;->a:Lcom/android/quickstep/views/TaskContainer;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/M0;->a:Lcom/android/quickstep/views/TaskContainer;

    .line 2
    .line 3
    check-cast p1, Ljava/lang/Float;

    .line 4
    .line 5
    invoke-static {p0, p1}, Lcom/android/quickstep/util/SplitAnimationController;->c(Lcom/android/quickstep/views/TaskContainer;Ljava/lang/Float;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
