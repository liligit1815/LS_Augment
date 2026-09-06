.class public final Lb5/e;
.super Ljava/lang/Object;
.source "Subscriptions.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb5/e$a;
    }
.end annotation


# static fields
.field private static final a:Lb5/e$a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lb5/e$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lb5/e$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lb5/e;->a:Lb5/e$a;

    .line 7
    .line 8
    return-void
.end method

.method public static a(LT4/a;)Lrx/i;
    .locals 0

    .line 1
    invoke-static {p0}, Lb5/a;->b(LT4/a;)Lb5/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static b()Lrx/i;
    .locals 1

    .line 1
    invoke-static {}, Lb5/a;->a()Lb5/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static c()Lrx/i;
    .locals 1

    .line 1
    sget-object v0, Lb5/e;->a:Lb5/e$a;

    .line 2
    .line 3
    return-object v0
.end method
