.class public LA0/g;
.super Ljava/lang/Object;
.source "LottieCompositionCache.java"


# static fields
.field private static final b:LA0/g;


# instance fields
.field private final a:Lo/l;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lo/l<",
            "Ljava/lang/String;",
            "Lv0/h;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, LA0/g;

    .line 2
    .line 3
    invoke-direct {v0}, LA0/g;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LA0/g;->b:LA0/g;

    .line 7
    .line 8
    return-void
.end method

.method constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lo/l;

    .line 5
    .line 6
    const/16 v1, 0x14

    .line 7
    .line 8
    invoke-direct {v0, v1}, Lo/l;-><init>(I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, LA0/g;->a:Lo/l;

    .line 12
    .line 13
    return-void
.end method

.method public static b()LA0/g;
    .locals 1

    .line 1
    sget-object v0, LA0/g;->b:LA0/g;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public a(Ljava/lang/String;)Lv0/h;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    iget-object p0, p0, LA0/g;->a:Lo/l;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lo/l;->c(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lv0/h;

    .line 12
    .line 13
    return-object p0
.end method

.method public c(Ljava/lang/String;Lv0/h;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object p0, p0, LA0/g;->a:Lo/l;

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2}, Lo/l;->d(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    return-void
.end method
