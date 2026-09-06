.class public final LJ/N$d;
.super Ljava/lang/Object;
.source "Sequences.kt"

# interfaces
.implements LC4/e;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LJ/N;->b(Landroid/view/ViewGroup;)LC4/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "LC4/e<",
        "Landroid/view/View;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Landroid/view/ViewGroup;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    iput-object p1, p0, LJ/N$d;->a:Landroid/view/ViewGroup;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, LJ/E;

    .line 2
    .line 3
    iget-object p0, p0, LJ/N$d;->a:Landroid/view/ViewGroup;

    .line 4
    .line 5
    invoke-static {p0}, LJ/N;->a(Landroid/view/ViewGroup;)LC4/e;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, LC4/e;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget-object v1, LJ/N$b;->h:LJ/N$b;

    .line 14
    .line 15
    invoke-direct {v0, p0, v1}, LJ/E;-><init>(Ljava/util/Iterator;Lu4/l;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method
