.class Lcom/android/launcher3/folder/Folder$o;
.super Ljava/lang/Object;
.source "Folder.java"

# interfaces
.implements Lcom/android/launcher3/L4;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/folder/Folder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "o"
.end annotation


# instance fields
.field private final g:Lcom/android/launcher3/n0$a;

.field final synthetic h:Lcom/android/launcher3/folder/Folder;


# direct methods
.method constructor <init>(Lcom/android/launcher3/folder/Folder;Lcom/android/launcher3/n0$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/Folder$o;->h:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/folder/Folder$o;->g:Lcom/android/launcher3/n0$a;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/c;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$o;->h:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    iget v0, p1, Lcom/android/launcher3/folder/Folder;->S:I

    .line 4
    .line 5
    const/4 v1, -0x1

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget-object p1, p1, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/android/launcher3/V4;->scrollLeft()Z

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$o;->h:Lcom/android/launcher3/folder/Folder;

    .line 14
    .line 15
    invoke-static {p1, v1}, Lcom/android/launcher3/folder/Folder;->q0(Lcom/android/launcher3/folder/Folder;I)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v2, 0x1

    .line 20
    if-ne v0, v2, :cond_1

    .line 21
    .line 22
    iget-object p1, p1, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/android/launcher3/V4;->scrollRight()Z

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$o;->h:Lcom/android/launcher3/folder/Folder;

    .line 28
    .line 29
    invoke-static {p1, v1}, Lcom/android/launcher3/folder/Folder;->q0(Lcom/android/launcher3/folder/Folder;I)V

    .line 30
    .line 31
    .line 32
    :goto_0
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$o;->h:Lcom/android/launcher3/folder/Folder;

    .line 33
    .line 34
    iput v1, p1, Lcom/android/launcher3/folder/Folder;->S:I

    .line 35
    .line 36
    invoke-static {p1}, Lcom/android/launcher3/folder/Folder;->n0(Lcom/android/launcher3/folder/Folder;)Lcom/android/launcher3/c;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    new-instance v0, Lcom/android/launcher3/folder/Folder$n;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder$o;->h:Lcom/android/launcher3/folder/Folder;

    .line 43
    .line 44
    iget-object v2, p0, Lcom/android/launcher3/folder/Folder$o;->g:Lcom/android/launcher3/n0$a;

    .line 45
    .line 46
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/folder/Folder$n;-><init>(Lcom/android/launcher3/folder/Folder;Lcom/android/launcher3/n0$a;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, v0}, Lcom/android/launcher3/c;->e(Lcom/android/launcher3/L4;)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$o;->h:Lcom/android/launcher3/folder/Folder;

    .line 53
    .line 54
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    const v0, 0x7f0c0053

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getInteger(I)I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    add-int/lit16 p1, p1, 0x96

    .line 66
    .line 67
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder$o;->h:Lcom/android/launcher3/folder/Folder;

    .line 68
    .line 69
    invoke-static {p0}, Lcom/android/launcher3/folder/Folder;->n0(Lcom/android/launcher3/folder/Folder;)Lcom/android/launcher3/c;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    int-to-long v0, p1

    .line 74
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/c;->d(J)V

    .line 75
    .line 76
    .line 77
    :cond_1
    return-void
.end method
