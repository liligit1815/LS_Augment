.class public final LC4/i$a;
.super Ljava/lang/Object;
.source "Sequences.kt"

# interfaces
.implements LC4/e;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LC4/i;->b(Lu4/p;)LC4/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "LC4/e<",
        "TT;>;"
    }
.end annotation


# instance fields
.field final synthetic a:Lu4/p;


# direct methods
.method public constructor <init>(Lu4/p;)V
    .locals 0

    .line 1
    iput-object p1, p0, LC4/i$a;->a:Lu4/p;

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
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LC4/i$a;->a:Lu4/p;

    .line 2
    .line 3
    invoke-static {p0}, LC4/i;->a(Lu4/p;)Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
