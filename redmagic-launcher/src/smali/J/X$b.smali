.class public abstract LJ/X$b;
.super Ljava/lang/Object;
.source "WindowInsetsAnimationCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LJ/X;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "b"
.end annotation


# instance fields
.field private final a:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, LJ/X$b;->a:I

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a()I
    .locals 0

    .line 1
    iget p0, p0, LJ/X$b;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public abstract b(LJ/X;)V
.end method

.method public abstract c(LJ/X;)V
.end method

.method public abstract d(LJ/Y;Ljava/util/List;)LJ/Y;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LJ/Y;",
            "Ljava/util/List<",
            "LJ/X;",
            ">;)",
            "LJ/Y;"
        }
    .end annotation
.end method

.method public abstract e(LJ/X;LJ/X$a;)LJ/X$a;
.end method
