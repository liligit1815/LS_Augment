.class LH/e$e;
.super LH/e$d;
.source "TextDirectionHeuristicsCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LH/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "e"
.end annotation


# instance fields
.field private final b:Z


# direct methods
.method constructor <init>(LH/e$c;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LH/e$d;-><init>(LH/e$c;)V

    .line 2
    .line 3
    .line 4
    iput-boolean p2, p0, LH/e$e;->b:Z

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method protected a()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LH/e$e;->b:Z

    .line 2
    .line 3
    return p0
.end method
