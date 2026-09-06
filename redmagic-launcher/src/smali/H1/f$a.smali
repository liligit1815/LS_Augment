.class public final LH1/f$a;
.super Ljava/lang/Object;
.source "HotseatSpecsProvider.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LH1/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LH1/f$a;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lcom/android/launcher3/util/W1;)LH1/f;
    .locals 1

    .line 1
    const-string p0, "resourceHelper"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, LH1/n;

    .line 7
    .line 8
    invoke-direct {p0, p1}, LH1/n;-><init>(Lcom/android/launcher3/util/W1;)V

    .line 9
    .line 10
    .line 11
    sget-object p1, LH1/j$a$a;->k:LH1/j$a$a;

    .line 12
    .line 13
    sget-object v0, LH1/f$a$a;->g:LH1/f$a$a;

    .line 14
    .line 15
    invoke-virtual {p0, p1, v0}, LH1/n;->c(LH1/j$a$a;Lu4/q;)Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance p1, LH1/f;

    .line 20
    .line 21
    invoke-direct {p1, p0}, LH1/f;-><init>(Ljava/util/List;)V

    .line 22
    .line 23
    .line 24
    return-object p1
.end method
