.class Lcom/android/launcher3/mfvUtil/DefaultErrorActivity$a;
.super Ljava/lang/Object;
.source "DefaultErrorActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/mfvUtil/DefaultErrorActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/mfvUtil/DefaultErrorActivity;


# direct methods
.method constructor <init>(Lcom/android/launcher3/mfvUtil/DefaultErrorActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/mfvUtil/DefaultErrorActivity$a;->g:Lcom/android/launcher3/mfvUtil/DefaultErrorActivity;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 1
    sget-object p1, Lcom/android/launcher3/W2;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p2, p0, Lcom/android/launcher3/mfvUtil/DefaultErrorActivity$a;->g:Lcom/android/launcher3/mfvUtil/DefaultErrorActivity;

    .line 4
    .line 5
    invoke-virtual {p2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p2, p1, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string p2, "ACTIVITY_STATE"

    .line 19
    .line 20
    invoke-interface {p1, p2, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 25
    .line 26
    .line 27
    invoke-static {}, Lx1/w;->j()Lx1/w;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/DefaultErrorActivity$a;->g:Lcom/android/launcher3/mfvUtil/DefaultErrorActivity;

    .line 32
    .line 33
    invoke-virtual {p1, p0}, Lx1/w;->i(Landroid/content/Context;)V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    invoke-static {p0}, Landroid/os/Process;->killProcess(I)V

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x1

    .line 44
    invoke-static {p0}, Ljava/lang/System;->exit(I)V

    .line 45
    .line 46
    .line 47
    return-void
.end method
