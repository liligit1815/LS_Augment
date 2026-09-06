.class Lcom/android/launcher3/folder/Folder$b;
.super LO0/a;
.source "Folder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/folder/Folder;->A0(Lcom/android/launcher3/dragndrop/p;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic i:Lcom/android/launcher3/folder/Folder;


# direct methods
.method constructor <init>(Lcom/android/launcher3/folder/Folder;Landroid/view/ViewGroup;Ljava/util/function/Function;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/Folder$b;->i:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3}, LO0/a;-><init>(Landroid/view/ViewGroup;Ljava/util/function/Function;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method protected a(ZLcom/android/launcher3/n0$a;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, LO0/a;->a(ZLcom/android/launcher3/n0$a;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder$b;->i:Lcom/android/launcher3/folder/Folder;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->w:Landroid/view/View;

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    const/4 p1, 0x4

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p1, 0x0

    .line 13
    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setImportantForAccessibility(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
