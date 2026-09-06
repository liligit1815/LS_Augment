.class Lcom/android/launcher3/taskbar/I1$c;
.super Ljava/lang/Object;
.source "TaskbarActivityContext.java"

# interfaces
.implements Lcom/android/launcher3/folder/Folder$m;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/I1;->n0(Lcom/android/launcher3/folder/FolderIcon;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/folder/Folder;

.field final synthetic b:Lcom/android/launcher3/taskbar/I1;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/folder/Folder;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/I1$c;->b:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/taskbar/I1$c;->a:Lcom/android/launcher3/folder/Folder;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/taskbar/I1$c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/I1$c;->c()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic c()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1$c;->b:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/I1;->j2(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1$c;->b:Lcom/android/launcher3/taskbar/I1;

    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/I1;->j2(Z)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    if-nez p1, :cond_1

    .line 12
    .line 13
    iget-object p1, p0, Lcom/android/launcher3/taskbar/I1$c;->b:Lcom/android/launcher3/taskbar/I1;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->w0()Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    new-instance v0, Lcom/android/launcher3/taskbar/J1;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/J1;-><init>(Lcom/android/launcher3/taskbar/I1$c;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->post(Ljava/lang/Runnable;)Z

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1$c;->a:Lcom/android/launcher3/folder/Folder;

    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/Folder;->setPriorityOnFolderStateChangedListener(Lcom/android/launcher3/folder/Folder$m;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method
