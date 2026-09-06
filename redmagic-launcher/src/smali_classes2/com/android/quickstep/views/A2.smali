.class public final synthetic Lcom/android/quickstep/views/A2;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lu4/l;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/views/TaskView;

.field public final synthetic h:I


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/views/TaskView;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/views/A2;->g:Lcom/android/quickstep/views/TaskView;

    .line 5
    .line 6
    iput p2, p0, Lcom/android/quickstep/views/A2;->h:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/A2;->g:Lcom/android/quickstep/views/TaskView;

    .line 2
    .line 3
    iget p0, p0, Lcom/android/quickstep/views/A2;->h:I

    .line 4
    .line 5
    check-cast p1, Landroid/view/View;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Lcom/android/quickstep/views/TaskView;->e(Lcom/android/quickstep/views/TaskView;ILandroid/view/View;)Lh4/t;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
