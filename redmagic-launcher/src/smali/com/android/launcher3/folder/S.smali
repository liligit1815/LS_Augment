.class public final synthetic Lcom/android/launcher3/folder/S;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/folder/FolderNameProvider;

.field public final synthetic b:Lcom/android/launcher3/folder/K;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/folder/FolderNameProvider;Lcom/android/launcher3/folder/K;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/folder/S;->a:Lcom/android/launcher3/folder/FolderNameProvider;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/folder/S;->b:Lcom/android/launcher3/folder/K;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/S;->a:Lcom/android/launcher3/folder/FolderNameProvider;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/folder/S;->b:Lcom/android/launcher3/folder/K;

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/model/data/d;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Lcom/android/launcher3/folder/FolderNameProvider;->e(Lcom/android/launcher3/folder/FolderNameProvider;Lcom/android/launcher3/folder/K;Lcom/android/launcher3/model/data/d;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
