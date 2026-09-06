.class public final synthetic Lz1/b;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/launcher3/D3$a;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/model/data/p;

.field public final synthetic b:Lcom/android/launcher3/model/data/y;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/model/data/p;Lcom/android/launcher3/model/data/y;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/b;->a:Lcom/android/launcher3/model/data/p;

    .line 5
    .line 6
    iput-object p2, p0, Lz1/b;->b:Lcom/android/launcher3/model/data/y;

    .line 7
    .line 8
    iput p3, p0, Lz1/b;->c:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a(Lz1/y0$b;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lz1/b;->a:Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    iget-object v1, p0, Lz1/b;->b:Lcom/android/launcher3/model/data/y;

    .line 4
    .line 5
    iget p0, p0, Lz1/b;->c:I

    .line 6
    .line 7
    invoke-static {v0, v1, p0, p1}, Lz1/e;->b(Lcom/android/launcher3/model/data/p;Lcom/android/launcher3/model/data/y;ILz1/y0$b;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
