.class public final LN3/a$a;
.super Ljava/lang/Object;
.source "LogUtilsConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LN3/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 2
    invoke-direct {p0}, LN3/a$a;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()LN3/a;
    .locals 0

    .line 1
    sget-object p0, LN3/a$b;->a:LN3/a$b;

    .line 2
    .line 3
    invoke-virtual {p0}, LN3/a$b;->a()LN3/a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
