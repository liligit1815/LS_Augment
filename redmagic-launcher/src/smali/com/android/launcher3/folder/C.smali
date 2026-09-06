.class public final synthetic Lcom/android/launcher3/folder/C;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/folder/FolderIcon;

.field public final synthetic h:Lcom/android/launcher3/n0$a;

.field public final synthetic i:Lcom/android/launcher3/folder/K;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/folder/FolderIcon;Lcom/android/launcher3/n0$a;Lcom/android/launcher3/folder/K;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/folder/C;->g:Lcom/android/launcher3/folder/FolderIcon;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/folder/C;->h:Lcom/android/launcher3/n0$a;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/folder/C;->i:Lcom/android/launcher3/folder/K;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/C;->g:Lcom/android/launcher3/folder/FolderIcon;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/folder/C;->h:Lcom/android/launcher3/n0$a;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/folder/C;->i:Lcom/android/launcher3/folder/K;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/android/launcher3/folder/FolderIcon;->m(Lcom/android/launcher3/folder/FolderIcon;Lcom/android/launcher3/n0$a;Lcom/android/launcher3/folder/K;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
