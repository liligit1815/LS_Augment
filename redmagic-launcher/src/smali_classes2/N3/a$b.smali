.class public final LN3/a$b;
.super Ljava/lang/Object;
.source "LogUtilsConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LN3/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# static fields
.field public static final a:LN3/a$b;

.field private static final b:LN3/a;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LN3/a$b;

    .line 2
    .line 3
    invoke-direct {v0}, LN3/a$b;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LN3/a$b;->a:LN3/a$b;

    .line 7
    .line 8
    new-instance v0, LN3/a;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-direct {v0, v1}, LN3/a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 12
    .line 13
    .line 14
    sput-object v0, LN3/a$b;->b:LN3/a;

    .line 15
    .line 16
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a()LN3/a;
    .locals 0

    .line 1
    sget-object p0, LN3/a$b;->b:LN3/a;

    .line 2
    .line 3
    return-object p0
.end method
