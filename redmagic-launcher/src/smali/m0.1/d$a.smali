.class public final Lm0/d$a;
.super Ljava/lang/Object;
.source "WindowSdkExtensions.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lm0/d;
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
    invoke-direct {p0}, Lm0/d$a;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Lm0/d;
    .locals 1

    .line 1
    invoke-static {}, Lm0/d;->a()Lm0/e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Lm0/d$a$a;

    .line 6
    .line 7
    invoke-direct {v0}, Lm0/d$a$a;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-interface {p0, v0}, Lm0/e;->a(Lm0/d;)Lm0/d;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method
