.class public final synthetic Lcom/android/launcher3/folder/c0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Function;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/folder/FolderPagedView;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/folder/FolderPagedView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/folder/c0;->a:Lcom/android/launcher3/folder/FolderPagedView;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/c0;->a:Lcom/android/launcher3/folder/FolderPagedView;

    .line 2
    .line 3
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/FolderPagedView;->e0(Lcom/android/launcher3/model/data/y;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
