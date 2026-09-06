.class public final synthetic Lcom/android/quickstep/views/z2;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/views/TaskView;

.field public final synthetic h:Lcom/android/quickstep/views/TaskView;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/views/z2;->g:Lcom/android/quickstep/views/TaskView;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/views/z2;->h:Lcom/android/quickstep/views/TaskView;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/z2;->g:Lcom/android/quickstep/views/TaskView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/views/z2;->h:Lcom/android/quickstep/views/TaskView;

    .line 4
    .line 5
    invoke-static {v0, p0, p1, p2}, Lcom/android/quickstep/views/TaskView;->y(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskView;Landroid/content/DialogInterface;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
