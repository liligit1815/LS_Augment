.class public interface abstract Lp0/f;
.super Ljava/lang/Object;
.source "WindowInfoTracker.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lp0/f$a;
    }
.end annotation


# static fields
.field public static final a:Lp0/f$a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Lp0/f$a;->a:Lp0/f$a;

    .line 2
    .line 3
    sput-object v0, Lp0/f;->a:Lp0/f$a;

    .line 4
    .line 5
    return-void
.end method

.method public static a(Landroid/content/Context;)Lp0/f;
    .locals 1

    .line 1
    sget-object v0, Lp0/f;->a:Lp0/f$a;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lp0/f$a;->d(Landroid/content/Context;)Lp0/f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method


# virtual methods
.method public abstract b(Landroid/app/Activity;)LI4/d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            ")",
            "LI4/d<",
            "Lp0/j;",
            ">;"
        }
    .end annotation
.end method
