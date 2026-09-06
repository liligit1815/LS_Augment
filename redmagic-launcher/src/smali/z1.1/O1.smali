.class public final synthetic Lz1/O1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lz1/c2;

.field public final synthetic b:Lcom/android/launcher3/folder/FolderNameProvider;


# direct methods
.method public synthetic constructor <init>(Lz1/c2;Lcom/android/launcher3/folder/FolderNameProvider;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/O1;->a:Lz1/c2;

    .line 5
    .line 6
    iput-object p2, p0, Lz1/O1;->b:Lcom/android/launcher3/folder/FolderNameProvider;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lz1/O1;->a:Lz1/c2;

    .line 2
    .line 3
    iget-object p0, p0, Lz1/O1;->b:Lcom/android/launcher3/folder/FolderNameProvider;

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Lz1/c2;->h(Lz1/c2;Lcom/android/launcher3/folder/FolderNameProvider;Lcom/android/launcher3/model/data/y;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
