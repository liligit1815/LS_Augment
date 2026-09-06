.class Lcom/android/launcher3/folder/FolderNameProvider$a;
.super Ljava/lang/Object;
.source "FolderNameProvider.java"

# interfaces
.implements Lcom/android/launcher3/D3$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/folder/FolderNameProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/folder/FolderNameProvider;


# direct methods
.method private constructor <init>(Lcom/android/launcher3/folder/FolderNameProvider;)V
    .locals 0

    .line 2
    iput-object p1, p0, Lcom/android/launcher3/folder/FolderNameProvider$a;->a:Lcom/android/launcher3/folder/FolderNameProvider;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/folder/FolderNameProvider;Lcom/android/launcher3/folder/X;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/folder/FolderNameProvider$a;-><init>(Lcom/android/launcher3/folder/FolderNameProvider;)V

    return-void
.end method


# virtual methods
.method public a(Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/folder/FolderNameProvider$a;->a:Lcom/android/launcher3/folder/FolderNameProvider;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/android/launcher3/folder/FolderNameProvider;->i(Lz1/y0;)Lcom/android/launcher3/util/A0;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    iput-object p2, p1, Lcom/android/launcher3/folder/FolderNameProvider;->g:Lcom/android/launcher3/util/A0;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderNameProvider$a;->a:Lcom/android/launcher3/folder/FolderNameProvider;

    .line 10
    .line 11
    invoke-virtual {p3}, Lz1/m;->i()[Lcom/android/launcher3/model/data/d;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Lcom/android/launcher3/folder/FolderNameProvider;->h:Ljava/util/List;

    .line 20
    .line 21
    return-void
.end method
