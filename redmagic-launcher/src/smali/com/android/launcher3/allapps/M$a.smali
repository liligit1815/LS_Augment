.class public Lcom/android/launcher3/allapps/M$a;
.super Ljava/lang/Object;
.source "AlphabeticalAppsList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/allapps/M;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final a:Ljava/lang/CharSequence;

.field public final b:I

.field public c:I


# direct methods
.method public constructor <init>(Ljava/lang/CharSequence;I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/android/launcher3/allapps/M$a;->c:I

    .line 6
    .line 7
    iput-object p1, p0, Lcom/android/launcher3/allapps/M$a;->a:Ljava/lang/CharSequence;

    .line 8
    .line 9
    iput p2, p0, Lcom/android/launcher3/allapps/M$a;->b:I

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/allapps/M$a;->c:I

    .line 2
    .line 3
    return-void
.end method
