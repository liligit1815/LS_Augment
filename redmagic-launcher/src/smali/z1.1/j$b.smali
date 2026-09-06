.class Lz1/j$b;
.super Ljava/lang/Object;
.source "AddWorkspaceItemsTask.java"

# interfaces
.implements Lcom/android/launcher3/D3$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lz1/j;->g(Lz1/o3;Lcom/android/launcher3/model/data/y;Lz1/y0;)[I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/model/data/p;

.field final synthetic b:Lcom/android/launcher3/model/data/I;


# direct methods
.method constructor <init>(Lz1/j;Lcom/android/launcher3/model/data/p;Lcom/android/launcher3/model/data/I;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lz1/j$b;->a:Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    iput-object p3, p0, Lz1/j$b;->b:Lcom/android/launcher3/model/data/I;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lz1/y0$b;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lz1/j$b;->a:Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    iget-object p0, p0, Lz1/j$b;->b:Lcom/android/launcher3/model/data/I;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p1, p0, v0}, Lcom/android/launcher3/model/data/p;->C(Lcom/android/launcher3/model/data/y;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
