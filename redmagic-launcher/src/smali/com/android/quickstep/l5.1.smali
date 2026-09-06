.class public final synthetic Lcom/android/quickstep/l5;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Function;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/views/RecentsViewContainer;

.field public final synthetic b:Lcom/android/quickstep/views/TaskContainer;

.field public final synthetic c:Lcom/android/quickstep/views/TaskView;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/quickstep/views/TaskContainer;Lcom/android/quickstep/views/TaskView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/l5;->a:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/l5;->b:Lcom/android/quickstep/views/TaskContainer;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/l5;->c:Lcom/android/quickstep/views/TaskView;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/l5;->a:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/l5;->b:Lcom/android/quickstep/views/TaskContainer;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/l5;->c:Lcom/android/quickstep/views/TaskView;

    .line 6
    .line 7
    check-cast p1, Lcom/android/launcher3/util/y2$b;

    .line 8
    .line 9
    invoke-static {v0, v1, p0, p1}, Lcom/android/quickstep/TaskShortcutFactory$2;->a(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/quickstep/views/TaskContainer;Lcom/android/quickstep/views/TaskView;Lcom/android/launcher3/util/y2$b;)Lcom/android/launcher3/popup/P;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
