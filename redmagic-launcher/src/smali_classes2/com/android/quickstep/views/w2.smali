.class public final synthetic Lcom/android/quickstep/views/w2;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lu4/p;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/views/TaskView;

.field public final synthetic h:Lcom/android/quickstep/views/TaskContainer;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskContainer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/views/w2;->g:Lcom/android/quickstep/views/TaskView;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/views/w2;->h:Lcom/android/quickstep/views/TaskContainer;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/w2;->g:Lcom/android/quickstep/views/TaskView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/views/w2;->h:Lcom/android/quickstep/views/TaskContainer;

    .line 4
    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    check-cast p2, Ljava/lang/Integer;

    .line 12
    .line 13
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    invoke-static {v0, p0, p1, p2}, Lcom/android/quickstep/views/TaskView;->f(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskContainer;II)Lh4/t;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method
