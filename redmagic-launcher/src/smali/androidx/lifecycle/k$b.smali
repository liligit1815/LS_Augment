.class Landroidx/lifecycle/k$b;
.super Landroidx/lifecycle/k$d;
.source "LiveData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/lifecycle/k;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/lifecycle/k<",
        "TT;>.d;"
    }
.end annotation


# instance fields
.field final synthetic k:Landroidx/lifecycle/k;


# direct methods
.method constructor <init>(Landroidx/lifecycle/k;LW/i;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LW/i<",
            "-TT;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Landroidx/lifecycle/k$b;->k:Landroidx/lifecycle/k;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Landroidx/lifecycle/k$d;-><init>(Landroidx/lifecycle/k;LW/i;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method d()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
