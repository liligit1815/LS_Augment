.class Lcom/android/launcher3/taskbar/I1$b;
.super Ljava/lang/Object;
.source "TaskbarActivityContext.java"

# interfaces
.implements Lcom/android/launcher3/folder/Folder$m;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/I1;->a2(Landroid/view/View;)V
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
    iput-object p1, p0, Lcom/android/launcher3/taskbar/I1$b;->b:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/taskbar/I1$b;->a:Lcom/android/launcher3/folder/Folder;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/android/launcher3/taskbar/I1$b;->a:Lcom/android/launcher3/folder/Folder;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Lcom/android/launcher3/folder/Folder;->X1(Lcom/android/launcher3/folder/Folder$m;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I1$b;->b:Lcom/android/launcher3/taskbar/I1;

    .line 9
    .line 10
    invoke-static {p0}, Lcom/android/launcher3/taskbar/I1;->W(Lcom/android/launcher3/taskbar/I1;)Lcom/android/launcher3/taskbar/R1;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 15
    .line 16
    const/4 p1, 0x1

    .line 17
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/a4;->N0(Z)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
