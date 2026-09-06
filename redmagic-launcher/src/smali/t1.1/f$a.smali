.class public final Lt1/f$a;
.super Ljava/lang/Object;
.source "BaseIconCache.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lt1/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public a:Ls1/d;

.field public b:Ljava/lang/CharSequence;

.field public c:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ls1/d;->i:Ls1/d;

    .line 5
    .line 6
    const-string v1, "LOW_RES_INFO"

    .line 7
    .line 8
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lt1/f$a;->a:Ls1/d;

    .line 12
    .line 13
    const-string v0, ""

    .line 14
    .line 15
    iput-object v0, p0, Lt1/f$a;->b:Ljava/lang/CharSequence;

    .line 16
    .line 17
    iput-object v0, p0, Lt1/f$a;->c:Ljava/lang/CharSequence;

    .line 18
    .line 19
    return-void
.end method
