.class public final synthetic Ld1/b;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/model/data/I;

.field public final synthetic h:Lcom/android/launcher3/model/data/p;

.field public final synthetic i:Lcom/android/launcher3/folder/Folder;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/model/data/I;Lcom/android/launcher3/model/data/p;Lcom/android/launcher3/folder/Folder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ld1/b;->g:Lcom/android/launcher3/model/data/I;

    .line 5
    .line 6
    iput-object p2, p0, Ld1/b;->h:Lcom/android/launcher3/model/data/p;

    .line 7
    .line 8
    iput-object p3, p0, Ld1/b;->i:Lcom/android/launcher3/folder/Folder;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ld1/b;->g:Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    iget-object v1, p0, Ld1/b;->h:Lcom/android/launcher3/model/data/p;

    .line 4
    .line 5
    iget-object p0, p0, Ld1/b;->i:Lcom/android/launcher3/folder/Folder;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/android/launcher3/cloudfolder/a;->a(Lcom/android/launcher3/model/data/I;Lcom/android/launcher3/model/data/p;Lcom/android/launcher3/folder/Folder;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
